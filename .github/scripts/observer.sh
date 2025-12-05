#!/usr/bin/env bash
set -euo pipefail
WORKDIR="$(pwd)"
DIAG_DIR=diagnostics/observer
mkdir -p "$DIAG_DIR"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
DOMAIN=${DOMAIN:-qrpruf.sanadidari.com}
REPORT="$DIAG_DIR/report-$TIMESTAMP.txt"

echo "Observer run $TIMESTAMP for $DOMAIN" > "$REPORT"
# 1) HTTP check with timings
curl -s -w "HTTP_CODE:%{http_code}\nTIME_TOTAL:%{time_total}\n" -o "$DIAG_DIR/body-$TIMESTAMP.html" "https://$DOMAIN" >> "$REPORT" || true

# 2) TLS expiry
echo "" >> "$REPORT"
echo "TLS info:" >> "$REPORT"
echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null | openssl x509 -noout -dates -issuer -subject >> "$REPORT" || true

# 3) quick performance metric: main.dart.js size if present
MAINJS_URL="https://$DOMAIN/main.dart.js"
SIZE=$(curl -sI "$MAINJS_URL" | awk '/Content-Length/ {print $2}' | tr -d '\r' || echo "unknown")
echo "main.dart.js size: $SIZE" >> "$REPORT"

# 4) create alert if HTTP code not 200 or TIME_TOTAL > 5s
HTTP_CODE=$(grep -oP 'HTTP_CODE:\K[0-9]+' "$REPORT" || echo "000")
TIME_TOTAL=$(grep -oP 'TIME_TOTAL:\K.*' "$REPORT" || echo "0")
ALERT=0
if [ "$HTTP_CODE" != "200" ]; then ALERT=1; fi
# convert time to float compare
TIMEF=$(printf "%.0f" $(echo "$TIME_TOTAL*1000" | bc -l))
if [ "$TIMEF" -gt 5000 ]; then ALERT=1; fi

if [ "$ALERT" -eq 1 ]; then
  echo "ALERT triggered. Sending notification if SLACK_WEBHOOK configured." >> "$REPORT"
  if [ -n "${SLACK_WEBHOOK:-}" ]; then
    PAYLOAD=$(jq -n --arg text "Production observer alert for $DOMAIN\nHTTP:$HTTP_CODE TIME:$TIME_TOTAL" '{text:$text}')
    curl -s -X POST -H 'Content-type: application/json' --data "$PAYLOAD" "$SLACK_WEBHOOK" || true
  fi
  # also create an issue for visibility
  jq -n --arg t "Observer Alert: $DOMAIN $TIMESTAMP" --arg b "$(cat $REPORT)" '{title:$t, body:$b}' > "$DIAG_DIR/issue.json"
  curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github+json" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/issues -d @"$DIAG_DIR/issue.json" || true
fi

cp "$REPORT" "$DIAG_DIR/report-latest.txt"
echo "Observer run saved to $REPORT"
