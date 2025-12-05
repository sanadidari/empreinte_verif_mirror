#!/usr/bin/env bash
set -e
mkdir -p assets/icons
cat > assets/icons/Icon-192.png <<'BASE64'
iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=
BASE64
git add assets/icons/Icon-192.png
