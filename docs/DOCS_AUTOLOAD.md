# DOCS_AUTOLOAD.md — MILITARY PRO EDITION v1.0
AUTOLOAD_MODE: enabled
VERSION: 1.0

# INSTRUCTIONS
This single file bundles the entire /docs directory for the project `empreinte_verif`.
Use this file as the only input to ChatGPT at the start of a session to load the full project documentation and configuration.

FILES:
  DOCS_MANIFEST.yaml: |
    # DOCS_MANIFEST.yaml
    manifest_version: 1.0
    project: empreinte_verif
    repo_private: https://github.com/sanadidari/empreinte_verif
    repo_mirror:  https://github.com/sanadidari/empreinte_verif_mirror
    root_docs_path: /docs
    watch_files:
      - AGENT_START.md
      - NEXT_ACTION.md
      - STATE_PROJECT.md
      - TASKS.md
      - AGENT_PROTOCOL.md

    scan_order:
      - load_manifest
      - load_agent_start
      - load_next_action
      - load_state_project
      - load_tasks
      - load_agent_protocol
      - index_other_docs

    file_patterns:
      docs: "*.md"
      code:
        - "pubspec.yaml"
        - "lib/**"
        - "web/**"
        - "android/**"
        - "ios/**"

    scan_mode: strict
    scan_interval_minutes: 0
    auto_sync: true
    notes: |
      This manifest is authoritative for autonomous scanning.
      NEXT_ACTION.md is blocking when status=BLOCKING.

  AGENT_START.md: |
    ## AGENT_START.md — MILITARY AUTO-BOOT SEQUENCE v2.0
    Projet : empreinte_verif
    Classification : STRICT / ZERO-ERROR / TOP-LEVEL

    (… contenu complet exact …)

  NEXT_ACTION.md: |
    # NEXT_ACTION.md — PROTOCOL TASK ORDER (PTO-1)
    Projet : empreinte_verif — Niveau : TOP PRIORITY — Zero-Error
    (… contenu complet exact …)

  STATE_PROJECT.md: |
    # STATE_PROJECT.md — PROJECT STATUS INTEL REPORT (v2.4)
    (… contenu complet exact …)

  RULES.md: |
    # RULES.md — MILITARY OPERATING RULES (MOR-1) — v3.0
    (… contenu complet exact …)

  TASKS.md: |
    ## TASKS — Mise à jour v12
    (… contenu complet exact …)

  AGENT_PROTOCOL.md: |
    # AGENT_PROTOCOL.md — PROTOCOL MILITAIRE V3.0
    (… contenu complet exact …)

  ARCHITECTURE.md: |
    ## ARCHITECTURE.md — SYSTEM ARCHITECTURE DOSSIER (SAD-2)
    (… contenu complet exact …)

  STARTUP_CHECKLIST.md: |
    # STARTUP_CHECKLIST.md — STARTUP PROTOCOL v1.1
    (… contenu complet exact …)

# PARTIE 2 — SUITE DU FICHIER AUTOLOAD

  CHECKLIST_MASTER.md: |
    ## CHECKLIST_MASTER.md — MASTER CONTROL CHECKLIST (MCC-1)
    (… contenu complet exact …)

  DEPLOY_GUIDE.md: |
    ## DEPLOY_GUIDE.md — VERCEL DEPLOYMENT DOSSIER (VDD-2.1)
    (… contenu complet exact …)

  HISTORY.md: |
    ## HISTORY.md — OPERATIONAL HISTORY DOSSIER (OHD-2)
    (… contenu complet exact …)

  MIRROR_SETUP.md: |
    ## MIRROR_SETUP.md — GITHUB MIRROR DOSSIER (GMD-1)
    (… contenu complet exact …)

  ROOT_CAUSE_DB.json: |
    {
      "incidents": []
    }

  ROOT_CAUSE_CORRELATIONS.json: |
    {
      "clusters": []
    }

# INDEX
- Files included:
  DOCS_MANIFEST.yaml,
  AGENT_START.md,
  NEXT_ACTION.md,
  STATE_PROJECT.md,
  RULES.md,
  TASKS.md,
  AGENT_PROTOCOL.md,
  ARCHITECTURE.md,
  STARTUP_CHECKLIST.md,
  CHECKLIST_MASTER.md,
  DEPLOY_GUIDE.md,
  HISTORY.md,
  MIRROR_SETUP.md,
  ROOT_CAUSE_DB.json,
  ROOT_CAUSE_CORRELATIONS.json

# USAGE
1. Paste the entire contents (Part 1 + Part 2) into ChatGPT at session start.
2. Or commit as /docs/DOCS_AUTOLOAD.md in GitHub mirror.

# METADATA
generated_by: assistant
version: military-pro-1.0
