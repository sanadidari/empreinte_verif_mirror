#!/bin/bash
# ======================================================
#  PRODUCTION OBSERVER v8.x — Sanad Idari Project
#  Continuous Monitoring of Deployment Health
# ======================================================

DOMAIN="https://qrpruf.sanadidari.com"
REPORT_DIR="observer_reports"
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/observer_$(date +%Y%m%d_%H%M).txt"

echo "=== PRODUCTION OBSERVER REPORT v8.x ===" >> "$REPORT_FILE"
echo "Generated at: $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 1. HTTP Status
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$DOMAIN")
echo "HTTP Status: $STATUS" >> "$REPORT_FILE"

# 2. Response Time
TIME=$(curl -o /dev/null -s -w "%{time_total}\n" "$DOMAIN")
echo "Response Time: ${TIME}s" >> "$REPORT_FILE"

# 3. Check critical assets
ASSETS=(
  "/"
  "/main.dart.js"
  "/flutter_bootstrap.js"
  "/manifest.json"
  "/version.json"
  "/icons/Icon-192.png"
)

echo "" >> "$REPORT_FILE"
echo "=== ASSET CHECKS ===" >> "$REPORT_FILE"

for ASSET in "${ASSETS[@]}"; do
  CODE=$(curl -o /dev/null -s -w "%{http_code}" "$DOMAIN$ASSET")
  echo "$ASSET → $CODE" >> "$REPORT_FILE"
done

# 4. Version fingerprint detection
VERSION=$(curl -s "$DOMAIN/version.json" | grep -Eo '"version":[^,]+' | cut -d '"' -f4)
echo "" >> "$REPORT_FILE"
echo "Detected Version: ${VERSION:-UNKNOWN}" >> "$REPORT_FILE"

# 5. Conclusion
echo "" >> "$REPORT_FILE"
echo "Observer scan complete." >> "$REPORT_FILE"

echo "Production observer finished."
