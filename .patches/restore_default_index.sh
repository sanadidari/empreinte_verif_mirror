#!/usr/bin/env bash
set -e
mkdir -p web
cat > web/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Recovered Flutter Web</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
</head>
<body>
  <script src="main.dart.js"></script>
</body>
</html>
HTML
git add web/index.html
