# STATE_PROJECT.md — MACHINE STATE FILE v1.0
project: empreinte_verif
state_version: 1.0
generated_by: machine
last_update: auto

## DIRECTORIES
flutter:
  root: "/"
  lib: "/lib"
  web: "/web"
  android: "/android"
  ios: "/ios"
  github: "/.github"
  workflows: "/.github/workflows"
  docs: "/docs"

## FLUTTER_STATUS
flutter_sdk: "stable"
web_support: true
platforms:
  - web
  - android
  - ios

## BUILD_TARGETS
web:
  command: "flutter build web --release"
  output: "build/web"
  critical_files:
    - "index.html"
    - "main.dart.js"
    - "flutter_bootstrap.js"
    - "manifest.json"
    - "favicon.png"

## GITHUB_ACTIONS
ci_cd:
  file: ".github/workflows/ci_cd.yml"
  enabled: true
rollback:
  file: ".github/workflows/rollback.yml"
  enabled: true
post_tests:
  file: ".github/workflows/post_deploy_tests.yml"
  enabled: true
healthcheck:
  file: ".github/workflows/healthcheck.yml"
  enabled: true
agent_trigger:
  file: ".github/workflows/agent_trigger.yml"
  enabled: true
heartbeat:
  file: ".github/workflows/agent_heartbeat.yml"
  enabled: true

## VERCEL_CONFIGURATION
domain: "qrpruf.sanadidari.com"
requires:
  - VERCEL_TOKEN
  - VERCEL_ORG_ID
  - VERCEL_PROJECT_ID

## DOCS_REQUIRED
- "AGENT_START.md"
- "DOCS_MANIFEST.yaml"
- "NEXT_ACTION.md"
- "DOCS_SCAN_INSTRUCTIONS.md"
- "STATE_PROJECT.md"
- "TASKS.md"
- "AGENT_PROTOCOL.md"
- "CHECKLIST_MASTER.md"

## MACHINE_RULES
strict_mode: true
auto_sync: true
allow_scan_repair: true

## HEALTH_SENSORS
monitoring:
  html_min_size: 3000
  main_js_min_size: 200000
  allow_404: false
  check_manifest: true
  check_icons: true

## NEXT_ACTION_POINTER
source: "/docs/NEXT_ACTION.md"
blocking: true

## END_OF_FILE
