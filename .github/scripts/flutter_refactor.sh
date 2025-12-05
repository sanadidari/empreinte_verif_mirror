#!/usr/bin/env bash
set -euo pipefail
# Flutter refactor helper - v6.0 (suggestions only)
WORKDIR="$(pwd)"
REPORT="$WORKDIR/diagnostics/flutter_refactor_report.txt"
mkdir -p diagnostics
echo "Flutter refactor run: $(date -u)" > "$REPORT"

# 1) pub outdated / pub get
flutter pub get >> "$REPORT" 2>&1 || true
echo "Pub packages listed." >> "$REPORT"

# 2) dart analyze
if flutter analyze --no-fatal-infos >> "$REPORT" 2>&1; then
  echo "No analyze errors" >> "$REPORT"
else
  echo "Analyze found issues - report appended" >> "$REPORT"
fi

# 3) Simple refactor heuristics: detect large files > 4000 lines
find lib -type f -name '*.dart' -print0 | xargs -0 wc -l 2>/dev/null | sort -nr | head -n 10 > diagnostics/large_dart_files.txt || true
echo "Large Dart files (top):" >> "$REPORT"
cat diagnostics/large_dart_files.txt >> "$REPORT"

# 4) Create suggestions file for human dev
echo "Suggestions:" > diagnostics/refactor_suggestions_$((RANDOM)).md
echo "- Split large widgets listed in diagnostics/large_dart_files.txt" >> diagnostics/refactor_suggestions_*.md || true

cp "$REPORT" diagnostics/flutter_refactor_report_latest.txt
echo "Refactor report written to $REPORT"
