# GOVERNOR_SPEC.md — Governor High-Level Command Protocol v2.0
Projet : empreinte_verif  
Classification : SUPREME — NON-NÉGOCIABLE — ZERO-ERROR

------------------------------------------------------------
1. RÔLE DU GOVERNOR
------------------------------------------------------------

Le Governor est l’entité suprême du système :
- définit les limites
- autorise ou interdit les modules autonomes
- approuve les actions critiques
- maintient la stabilité générale du projet
- protège contre :
  - boucles IA
  - refactors non autorisés
  - déploiements non validés
  - modification du code métier

Agents sous son autorité :
- Supervisor
- TITAN Engine
- OMEGA Engine
- Alpha-Advisor
- Matrix Coordinator

------------------------------------------------------------
2. ZONES AUTORISÉES / INTERDITES
------------------------------------------------------------

INTERDIT même en Mode 4 :
- lib/
- main.dart
- android/ ios/ windows/
- secrets GitHub
- build/web/

AUTORISÉ :
- docs/
- .github/workflows
- web/
- advisor/
- titan/
- omega/

------------------------------------------------------------
3. ORDRES ACTUELS DU GOVERNOR
------------------------------------------------------------

### 🟥 Ordre 1 — Phase active : BIOMÉTRIE
Aucun refactor, aucun déploiement final tant que test biométrique Android non validé.

### 🟦 Ordre 2 — CI/CD
Les workflows ne doivent pas être modifiés sauf :
- correction de panne
- optimisation validée par Supervisor

### 🟩 Ordre 3 — Documentation
Agents doivent mettre à jour :
- STATE_PROJECT.md
- TASKS.md
- SUPERVISOR_REPORT.md

### 🟨 Ordre 4 — Synchronisation Miroir
Si OUTDATED → TITAN corrige automatiquement.

------------------------------------------------------------
4. MISE À JOUR DES ORDRES
------------------------------------------------------------

Seul l’utilisateur humain peut émettre :
- Governor Override
- Governor Reset
- Governor Elevation

------------------------------------------------------------
FIN — GOVERNOR_SPEC.md v2.0
