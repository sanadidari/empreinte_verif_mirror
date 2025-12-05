#!/usr/bin/env bash
set -e
mkdir -p web
cat > web/manifest.json <<'JSON'
{
  "name": "empreinte_verif",
  "short_name": "empreinte",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#317EFB"
}
JSON
git add web/manifest.json
