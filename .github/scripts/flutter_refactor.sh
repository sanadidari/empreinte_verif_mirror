#!/usr/bin/env bash
# Flutter Intelligent Refactor v6.x — Military Edition
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"
OUTDIR="$WORKDIR/refactor"
TIMESTAMP="$(date -u +'%Y%m%dT%H%M%SZ')"
REPORT="$OUTDIR/refactor_$TIMESTAMP.txt"

mkdir -p "$OUTDIR"

echo "=== FLUTTER INTELLIGENT REFACTOR v6.x ===" > "$REPORT"
echo "Timestamp: $TIMESTAMP" >> "$REPORT"
echo "" >> "$REPORT"

msg() {
  echo "$1" | tee -a "$REPORT"
}

# ---------- 1. Detect oversized widgets ----------
msg "[1] Detecting oversized widget classes (>500 lines)..."
find lib -type f -name "*.dart" -print0 | while IFS= read -r -d '' file; do
  LINES=$(wc -l < "$file")
  if [ "$LINES" -gt 500 ]; then
    msg "[WARN] Oversized widget: $file ($LINES lines)"
  fi
done
msg ""

# ---------- 2. Detect duplicated widgets ----------
msg "[2] Detecting duplicated widget names..."
grep -R "class .* extends StatelessWidget" -n lib > "$OUTDIR/tmp_classes.txt" || true
sort "$OUTDIR/tmp_classes.txt" | uniq -d >> "$REPORT" || true
rm -f "$OUTDIR/tmp_classes.txt"
msg ""

# ---------- 3. Detect long build() methods ----------
msg "[3] Detecting long build() methods (>200 lines)..."
grep -R "Widget build" -n lib | while read -r line; do
  FILE=$(echo "$line" | cut -d: -f1)
  LINE_NO=$(echo "$line" | cut -d: -f2)
  # Simple heuristic: if next "}" appears >200 lines down
  END_LINE=$(awk "NR>$LINE_NO && /}/ {print NR; exit}" "$FILE" || echo 0)
  if [ "$END_LINE" -gt "$((LINE_NO + 200))" ]; then
    msg "[WARN] Long build() in $FILE at line $LINE_NO (~$((END_LINE - LINE_NO)) lines)"
  fi
done
msg ""

# ---------- 4. Detect asset misuse ----------
msg "[4] Checking for missing assets referenced in code..."
grep -R "assets/" -n lib | while read -r ref; do
  ASSET_PATH=$(echo "$ref" | grep -o "assets/[a-zA-Z0-9_./-]*")
  if [ -n "$ASSET_PATH" ]; then
    if [ ! -f "assets/$ASSET_PATH" ] && [ ! -f "web/$ASSET_PATH" ]; then
      msg "[ERR] Missing asset referenced: $ASSET_PATH"
    fi
  fi
done
msg ""

# ---------- 5. Formatting (non-destructive) ----------
msg "[5] Running flutter format (non-destructive)..."
flutter format lib web || msg "[WARN] flutter format reported issues"

msg "[FINAL] Intelligent refactor analysis completed."
