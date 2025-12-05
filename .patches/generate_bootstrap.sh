#!/usr/bin/env bash
set -e
mkdir -p web
echo "// fallback bootstrap" > web/flutter_bootstrap.js
git add web/flutter_bootstrap.js
