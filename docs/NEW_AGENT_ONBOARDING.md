# NEW_AGENT_ONBOARDING.md — Military Onboarding Protocol v1.0
Projet : empreinte_verif
Classification : STRICT / ZERO-ERROR / PRO-MODE

Document obligatoire pour tout nouvel agent IA ou humain.
Définit les règles, étapes et zones autorisées/interdites.

------------------------------------------------------------
1. OBJECTIF
------------------------------------------------------------
- Comprendre l’architecture multi-agents
- Savoir où un agent peut agir ou non
- Suivre le protocole militaire v3.1
- Garantir stabilité et sécurité du projet

------------------------------------------------------------
2. ARCHITECTURE DES AGENTS
------------------------------------------------------------
Niveau 1 — Analyse :
- Crash Investigator
- Correlation Engine
- Alpha-Advisor

Niveau 2 — Action limitée :
- Auto-Patch Engine
- Auto-Merge Engine
- Workflow Rewriter

Niveau 3 — Autonomie avancée :
- TITAN Engine
- OMEGA Engine

Niveau 4 — Gouvernance :
- Supervisor
- Governor

------------------------------------------------------------
3. STRUCTURE DU REPO (VERSION COURTE)
------------------------------------------------------------
docs/  → documents maîtres
.github/workflows/ → workflows CI/CD et agents
tools/ → scripts Python des agents
.patches/ → correctifs simples
titan/ → état TITAN
omega/ → état OMEGA
advisor/ → état ADVISOR
lib/ → code Flutter (ZONE INTERDITE)
web/ → zone modifiable par agents

Documents critiques dans docs/ :
- AGENT_START.md
- DOCS_MANIFEST.yaml
- DOCS_SCAN_INSTRUCTIONS.md
- NEXT_ACTION.md
- STATE_PROJECT.md
- TASKS.md
- ROOT_CAUSE_DB.json
- ROOT_CAUSE_CORRELATIONS.json
- SUPERVISOR_REPORT.md
- GOVERNOR_SPEC.md
- OMEGA_SPEC.md
- ALPHA_ADVISOR_SPEC.md

------------------------------------------------------------
4. RÈGLES DE SÉCURITÉ
------------------------------------------------------------
Zones INTERDITES (aucun agent auto) :
- lib/
- android/
- ios/
- macos/
- windows/
- main.dart
- logique métier et UI

Zones AUTORISÉES (agents safe) :
- .patches/
- docs/
- .github/workflows/
- web/
- titan/
- omega/
- advisor/

Zones nécessitant validation humaine :
- secrets GitHub
- déploiements Vercel
- opérations Git critiques

------------------------------------------------------------
5. WORKFLOWS ESSENTIELS
------------------------------------------------------------
Crash Investigator :
→ Analyse crash → ROOT_CAUSE_DB.json

Correlation Engine :
→ Regroupe incidents → ROOT_CAUSE_CORRELATIONS.json

Supervisor :
→ Analyse système → SUPERVISOR_REPORT.md

Governor :
→ freeze / allow / accelerate agents

TITAN Engine :
→ auto-réparation, CI/CD, génération simple

OMEGA Engine :
→ optimisation, refactoring, versioning

Alpha-Advisor :
→ conseils prédictifs, aucune action automatique

------------------------------------------------------------
6. PROCESSUS POUR NOUVEL AGENT
------------------------------------------------------------
Étape 1 — Lire documents maîtres :
- AGENT_START.md
- DOCS_MANIFEST.yaml
- DOCS_SCAN_INSTRUCTIONS.md
- NEXT_ACTION.md

Étape 2 — Vérifier CI/CD :
- workflows valides
- secrets présents
- triggers cohérents
- zones autorisées respectées

Étape 3 — Vérifier l’état système :
- SUPERVISOR_REPORT.md
- governor/GOVERNOR_ORDERS.json
- titan/TITAN_STATE.json
- omega/OMEGA_STATE.json

Étape 4 — Vérifier build Flutter Web :
flutter pub get
flutter build web --release

Étape 5 — Vérifier roadmap :
- NEXT_ACTION.md
- STATE_PROJECT.md
- TASKS.md

Étape 6 — Vérifier anti-boucles :
- Governor actif
- Auto-Merge limité aux zones safe
- TITAN/OMEGA ne touchent pas aux zones interdites

------------------------------------------------------------
7. CHECKLIST RAPIDE
------------------------------------------------------------
✔ Lire documents maîtres
✔ Vérifier workflows & secrets
✔ Vérifier stabilité système
✔ Vérifier build Flutter
✔ Vérifier mission active
✔ Respecter zones interdites
✔ Vérifier supervision Governor

------------------------------------------------------------
8. ACTIONS AUTORISÉES
------------------------------------------------------------
- analyser
- recommander
- produire rapports
- mettre à jour états (titan, omega, advisor)
- modifier docs
- modifier workflows safe
- créer patchs simples dans .patches/

------------------------------------------------------------
9. ACTIONS INTERDITES
------------------------------------------------------------
- modifier lib/
- toucher logique UI / métier
- changer secrets
- déployer sans validation
- bypasser Governor ou Supervisor
- supprimer workflows critiques

------------------------------------------------------------
10. FIN DU DOCUMENT
Toute déviation doit être signalée immédiatement.
Respect strict du protocole militaire v3.1.
