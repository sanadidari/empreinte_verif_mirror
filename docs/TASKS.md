# TASKS.md — MACHINE TASK LIST v1.0
project: empreinte_verif
generated_by: agent
version: 1.0
last_update: auto

## FORMAT
# Chaque tâche possède :
# - id: identifiant unique
# - title: titre bref
# - status: PENDING | IN_PROGRESS | DONE | BLOCKED | FAILED
# - priority: LOW | MEDIUM | HIGH | TOP
# - blocking: true|false   (si true : empêche l'exécution automatique d'actions suivantes)
# - auto_execute: true|false (si true : l'agent peut exécuter automatiquement)
# - depends_on: [id,...]
# - commands: shell commands the agent may run (read-only in docs; must be executed in CI or by agent with permission)
# - artifacts: files produced
# - owner: agent|human|system
# - notes: human-readable notes (optional)

tasks:
  - id: T001
    title: verify_docs_manifest_and_agent_start
    status: PENDING
    priority: TOP
    blocking: true
    auto_execute: true
    depends_on: []
    commands:
      - "cat docs/DOCS_MANIFEST.yaml"
      - "grep -q 'manifest_version' docs/DOCS_MANIFEST.yaml"
      - "cat docs/AGENT_START.md"
    artifacts:
      - "docs/DOCS_MANIFEST.yaml"
      - "docs/AGENT_START.md"
    owner: agent
    notes: "Validate manifest and agent_start presence and basic format. Blocking: NEXT_ACTION processing depends on this."

  - id: T002
    title: verify_next_action
    status: PENDING
    priority: TOP
    blocking: true
    auto_execute: true
    depends_on: [T001]
    commands:
      - "cat docs/NEXT_ACTION.md"
      - "grep -q 'status: BLOCKING' docs/NEXT_ACTION.md || true"
    artifacts:
      - "docs/NEXT_ACTION.md"
    owner: agent
    notes: "Ensure NEXT_ACTION.md exists and parseable. If status: BLOCKING -> agent must not auto-proceed beyond reporting."

  - id: T003
    title: ensure_ci_cd_workflow_present
    status: PENDING
    priority: HIGH
    blocking: false
    auto_execute: true
    depends_on: [T001]
    commands:
      - "ls .github/workflows | grep -E 'ci_cd|ci-cd|ci' || true"
      - "test -f .github/workflows/ci_cd.yml || echo 'ci_cd_missing'"
    artifacts:
      - ".github/workflows/ci_cd.yml"
    owner: agent
    notes: "If missing, agent will tag TASKS.TEMPLATE_CI for creation."

  - id: T004
    title: validate_github_secrets
    status: PENDING
    priority: HIGH
    blocking: true
    auto_execute: true
    depends_on: [T003]
    commands:
      - "gh secret list --repo $GITHUB_REPOSITORY || true"
      - "echo 'Check VERCEL_TOKEN, VERCEL_ORG_ID, VERCEL_PROJECT_ID presence in repo secrets'"
    artifacts: []
    owner: agent
    notes: "Agent will check secrets via GitHub API; if secrets absent, task BLOCKED and notifies human."

  - id: T005
    title: run_ci_cd_build_dry_run
    status: PENDING
    priority: HIGH
    blocking: false
    auto_execute: true
    depends_on: [T003, T004]
    commands:
      - "flutter clean"
      - "flutter pub get"
      - "flutter build web --release --no-tree-shake-icons || true"
      - "du -sh build/web || true"
    artifacts:
      - "build/web"
    owner: agent
    notes: "Dry run build to verify compile; on CI should run in container."

  - id: T006
    title: deploy_to_vercel_via_action
    status: PENDING
    priority: TOP
    blocking: true
    auto_execute: true
    depends_on: [T005]
    commands:
      - "Trigger CI workflow or push minimal commit to activate deploy"
    artifacts:
      - "vercel deployment metadata"
    owner: agent
    notes: "Agent triggers deployment; if secrets or config missing -> task BLOCKED."

  - id: T007
    title: post_deploy_verification
    status: PENDING
    priority: HIGH
    blocking: false
    auto_execute: true
    depends_on: [T006]
    commands:
      - "curl -s -o /tmp/resp.html -w '%{http_code}' https://qrpruf.sanadidari.com"
      - "grep -iE 'error|exception|404|not found' /tmp/resp.html || true"
    artifacts:
      - "/tmp/resp.html"
    owner: agent
    notes: "Verify HTTP 200, size and absence of common errors."

  - id: T008
    title: produce_reports_and_update_docs
    status: PENDING
    priority: MEDIUM
    blocking: false
    auto_execute: true
    depends_on: [T002, T005, T007]
    commands:
      - "echo 'Write /docs/DOCUMENTATION_REPORT.md with status and artifacts'"
      - "git add docs/DOCUMENTATION_REPORT.md && git commit -m 'docs: update documentation report' || true"
    artifacts:
      - "docs/DOCUMENTATION_REPORT.md"
    owner: agent
    notes: "Agent writes report with collected logs/artifacts and pushes branch for PR when required."

  - id: T009
    title: monitoring_and_heartbeat_check
    status: PENDING
    priority: MEDIUM
    blocking: false
    auto_execute: true
    depends_on: [T008]
    commands:
      - "Trigger agent_heartbeat workflow or run local checks"
    artifacts: []
    owner: agent
    notes: "Periodic monitoring; runs hourly."

  - id: T010
    title: manual_ui_visual_validation
    status: PENDING
    priority: LOW
    blocking: true
    auto_execute: false
    depends_on: [T007]
    commands:
      - "HUMAN: perform visual QA, screenshots, cross-browser checks"
    artifacts: []
    owner: human
    notes: "Explicitly manual task. Agent must not attempt to perform visual verification."

## TEMPLATES / SUGGESTIONS
templates:
  - id: TEMPLATE_CI
    title: "ci_cd.yml template"
    description: "Auto-generated CI/CD pipeline for Flutter Web → Vercel. Agent can create this when T003 reports missing."

## END
