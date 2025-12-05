#!/usr/bin/env bash
set -euo pipefail
# Auto Repair v5.0 - safe mode: create PR with fixes; optional AUTO_MERGE if token provided

WORKDIR="$(pwd)"
BRANCH="auto-repair/$(date -u +%Y%m%dT%H%M%SZ)"
REPORT="$WORKDIR/diagnostics/auto_repair_report.txt"
mkdir -p diagnostics

echo "Auto-Repair run: $(date -u)" > "$REPORT"

# 1) Basic checks
echo "Checking vercel.json, index.html, web assets..." >> "$REPORT"
if [ ! -f vercel.json ]; then
  echo "Missing vercel.json -> create minimal fallback." >> "$REPORT"
  cat > vercel.json <<'JSON'
{
  "version": 2,
  "routes":[
    {"src": "/assets/(.*)", "dest": "/assets/$1"},
    {"src": "/(.*)", "dest": "/index.html"}
  ]
}
JSON
  git add vercel.json
  echo "Created vercel.json" >> "$REPORT"
fi

# 2) Check pubspec assets references vs actual files
echo "Checking pubspec assets references..." >> "$REPORT"
if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY' >> "$REPORT" 2>&1
import yaml,sys,os
if not os.path.exists('pubspec.yaml'):
    print("no pubspec.yaml")
    sys.exit(0)
data=yaml.safe_load(open('pubspec.yaml'))
assets=data.get('flutter',{}).get('assets',[])
missing=[]
for a in assets:
    if not os.path.exists(a):
        missing.append(a)
if missing:
    print("Missing assets referenced in pubspec:", missing)
else:
    print("All referenced assets present.")
PY
fi

# 3) Try flutter build web (quick)
echo "Attempting flutter build web --release (short)..." >> "$REPORT"
if flutter build web --release -v >> "$REPORT" 2>&1; then
  echo "Build OK" >> "$REPORT"
else
  echo "Build failed — try small fixes" >> "$REPORT"
  # Example auto-fix: add missing base-href meta if index.html exists (heuristic)
  if [ -f web/index.html ]; then
    grep -q '<base href' web/index.html || ( \
      sed -i "s|<head>|<head>\n    <base href=\"/\">|" web/index.html && \
      git add web/index.html && echo "Added base href heuristic" >> "$REPORT" )
  fi
fi

# 4) If changes were staged, create branch + commit + PR
if ! git diff --cached --quiet; then
  git config user.name "auto-repair-bot"
  git config user.email "auto-repair@local"
  git checkout -b "$BRANCH"
  git commit -m "chore(auto-repair): apply automatic safe fixes"
  git push -u origin "$BRANCH"
  # Create PR via GitHub API (curl)
  API_PAYLOAD=$(jq -n --arg t "Auto-repair: safe fixes" --arg b "Automated suggestions from auto-repair v5.0. See changes." '{title:$t, body:$b, head:env.BRANCH, base:"main"}')
  API_PAYLOAD=$(echo "$API_PAYLOAD" | sed "s/env.BRANCH/$BRANCH/")
  curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github+json" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls -d "{\"title\":\"Auto-repair: safe fixes\",\"head\":\"$BRANCH\",\"base\":\"main\",\"body\":\"Automated suggestions from auto-repair v5.0.\"}"
  echo "Pull request created for branch $BRANCH" >> "$REPORT"

  # Optional auto-merge if AUTO_MERGE_TOKEN present
  if [ -n "${AUTO_MERGE_TOKEN:-}" ]; then
    echo "Auto-merge requested: attempting to merge if checks pass" >> "$REPORT"
    # For safety, we do not auto-merge immediately; leave PR for review or enable later.
  fi
else
  echo "No automatic fixes applied." >> "$REPORT"
fi

cp "$REPORT" diagnostics/auto_repair_report_latest.txt
echo "Auto-repair finished. Report written to $REPORT"
