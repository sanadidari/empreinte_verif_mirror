#!/usr/bin/env bash
set -euo pipefail

echo "[auto_deploy] Start"

# sanity
if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: flutter not found in PATH"
  exit 2
fi

flutter clean
flutter pub get
flutter build web --release

if ! command -v vercel >/dev/null 2>&1; then
  echo "vercel CLI not found, installing..."
  npm install -g vercel
fi

# deploy
vercel deploy --prod --yes --token="${VERCEL_TOKEN:-}" --scope=sanad-idari build/web

echo "[auto_deploy] Done"
