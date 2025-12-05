# DOCS_SCAN_INSTRUCTIONS.md
version: 1.0

steps:
  - step_id: load_manifest
    action: fetch_file
    path: /docs/DOCS_MANIFEST.yaml

  - step_id: load_agent_start
    action: fetch_file
    path: /docs/AGENT_START.md

  - step_id: load_next_action
    action: fetch_file
    path: /docs/NEXT_ACTION.md

  - step_id: load_state_project
    action: fetch_file
    path: /docs/STATE_PROJECT.md

  - step_id: scan_code
    action: list_and_fetch
    path_patterns:
      - pubspec.yaml
      - lib/**
      - web/**
      - .github/workflows/**

agent_policy:
  auto_fetch_repos: true
  allow_read_mirror: true
  require_user_confirmation: destructive-only
