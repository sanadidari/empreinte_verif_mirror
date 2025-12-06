# DOCS_AUTOLOAD.md — MILITARY PRO EDITION v1.1
AUTOLOAD_MODE: enabled
VERSION: 1.1

# INSTRUCTIONS
This file bundles the full documentation for the project `empreinte_verif`.
At the start of every session, an agent must load this file FIRST to acquire:
- The full system vision
- The protocol military rules
- The current NEXT_ACTION
- The global architecture
- The entire documentation dataset

FILES:

  DOCS_MANIFEST.yaml: |
    manifest_version: 1.1
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
      - VISION_STRATEGIQUE.md     # ← ADDED

    scan_order:
      - load_manifest
      - load_agent_start
      - load_next_action
      - load_vision_strategique   # ← ADDED
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
      Manifest used for autonomous scanning.
      NEXT_ACTION.md is blocking when status=BLOCKING.

  AGENT_START.md: |
    ## AGENT_START.md — MILITARY AUTO-BOOT SEQUENCE v2.0
    (… ton contenu actuel exact …)

  VISION_STRATEGIQUE.md: |
    # VISION_STRATEGIQUE.md — MASTER VISION FILE
    Projet : empreinte_verif
    Classification : STRATEGIC / HIGH-LEVEL / ZERO-ERROR
    Version : 1.0 — Phase 1 (Biométrie)

    ## 1. VISION GLOBALE
    (… contenu complet de la vision stratégique ici …)

  NEXT_ACTION.md: |
    (… ton fichier exact …)

  STATE_PROJECT.md: |
    (… ton fichier exact …)

  RULES.md: |
    (… ton fichier exact …)

  TASKS.md: |
    (… ton fichier exact …)

  AGENT_PROTOCOL.md: |
    (… ton fichier exact …)

  ARCHITECTURE.md: |
    (… ton fichier exact …)

  STARTUP_CHECKLIST.md: |
    (… ton fichier exact …)

  CHECKLIST_MASTER.md: |
    (… ton fichier exact …)

  DEPLOY_GUIDE.md: |
    (… ton fichier exact …)

  HISTORY.md: |
    (… ton fichier exact …)

  MIRROR_SETUP.md: |
    (… ton fichier exact …)

  ROOT_CAUSE_DB.json: |
    {"incidents": []}

  ROOT_CAUSE_CORRELATIONS.json: |
    {"clusters": []}

# INDEX
- manifest
- agent_start
- vision_strategique
- next_action
- rules
- tasks
- architecture
- history
- checklists
- mirror_setup

# END OF FILE — DOCS_AUTOLOAD.md v1.1
