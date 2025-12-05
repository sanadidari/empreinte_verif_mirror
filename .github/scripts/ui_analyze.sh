#!/usr/bin/env bash
set -euo pipefail
# UI analyze: compare baseline screenshots (if any) and run quick accessibility heuristics
WORKDIR="$(pwd)"
DIAG=diagnostics
mkdir -p $DIAG/screenshots
OUT="$DIAG/ui_analysis_report.txt"
echo "UI analyze $(date -u)" > $OUT

INPUT="$1"
# If URL provided, download to diagnostics
if [ -n "$INPUT" ]; then
  if [[ "$INPUT" =~ ^https?:// ]]; then
    curl -sL "$INPUT" -o $DIAG/screenshots/input.png
  elif [ -f "$INPUT" ]; then
    cp "$INPUT" $DIAG/screenshots/input.png
  fi
fi

# If no input and repo has screenshots/ baseline, pick last
if [ ! -f $DIAG/screenshots/input.png ] && [ -d screenshots ]; then
  ls -1 screenshots | head -n1 | xargs -I {} cp screenshots/{} $DIAG/screenshots/input.png || true
fi

if [ ! -f $DIAG/screenshots/input.png ]; then
  echo "No screenshot provided." >> $OUT
  echo "UI analyze finished (no input)" && exit 0
fi

# 1) Basic checks: dimension, color contrast heuristic (very simple)
identify -format "Name: %f\nGeometry: %wx%h\n" $DIAG/screenshots/input.png >> $OUT

# 2) If baseline exists, compare perceptual difference
BASELINE="$DIAG/screenshots/baseline.png"
if [ -f "$BASELINE" ]; then
  compare -metric RMSE "$BASELINE" $DIAG/screenshots/input.png null: 2>> $OUT || true
  convert $DIAG/screenshots/input.png -gravity center -annotate 0 "Analyzed at $(date -u)" $DIAG/screenshots/annotated.png
  echo "Compared to baseline." >> $OUT
else
  echo "No baseline found; recommend saving this screenshot as baseline if desired." >> $OUT
fi

# 3) Accessibility heuristics (text size detection via OCR not implemented, but we check color depth)
identify -format "Colors: %[colors], Depth: %[depth]\n" $DIAG/screenshots/input.png >> $OUT

cp $OUT $DIAG/ui_analysis_report_latest.txt
echo "UI analyze report at $OUT"
