# NEW_AGENT_ONBOARDING.md — Military Onboarding Protocol v3.0  
Projet : empreinte_verif  
Classification : STRICT / PRO MODE / ZERO-ERROR  

Document OBLIGATOIRE pour tout nouvel agent IA ou humain.  
Toute déviation au protocole doit être reportée immédiatement au Governor.  

============================================================  
📌 1. OBJECTIFS  
============================================================  

- Expliquer comment fonctionne l’écosystème multi-agents du projet  
- Assurer la continuité et l’alignement stratégique du système  
- Prévenir toute action interdite (zones critiques Flutter)  
- Indiquer au prochain agent où nous en sommes réellement  
- Activer PRO MODE automatiquement à l’arrivée  

============================================================  
📌 2. ARCHITECTURE DES AGENTS  
============================================================  

### 🔵 NIVEAU 1 — Agents d’Analyse  
- Crash Investigator  
- Correlation Engine  
- Alpha-Advisor  
→ Aucun accès aux fichiers critiques Flutter.

### 🟠 NIVEAU 2 — Agents d’Action Contrôlée  
- Auto-Patch Engine  
- Auto-Merge Engine  
- Workflow Rewriter  

### 🔴 NIVEAU 3 — Agents Autonomes Avancés  
- TITAN Engine  
- OMEGA Engine  

### 🟣 NIVEAU 4 — Gouvernance  
- SUPERVISOR (surveillance 24/24)  
- GOVERNOR (autorité suprême, contrôle les agents)  

============================================================  
📌 3. STRUCTURE DU REPOSITORY  
============================================================  

### Zones Interdites ❌ (aucune modification automatique)
- `lib/`  
- `android/`  
- `ios/`  
- `macos/`  
- `windows/`  
- `main.dart`  
- Toute logique métier ou UI  

### Zones Autorisées ✔️  
- `docs/`  
- `.github/workflows/`  
- `.patches/`  
- `web/`  
- `titan/`  
- `omega/`  
- `advisor/`  

### Zones Sensibles ⚠️ (validation humaine obligatoire)
- Secrets GitHub  
- Déploiements web  
- Système de build (Android / iOS)  

============================================================  
📌 4. DOCUMENTS MAÎTRES À LIRE AVANT TOUTE ACTION  
============================================================  

1. `STATE_PROJECT.md` → statut actuel, TODO list active  
2. `TASKS.md` → tâches à effectuer immédiatement  
3. `NEXT_ACTION.md` → prochaine action autorisée  
4. `SUPERVISOR_REPORT.md`  
5. `GOVERNOR_SPEC.md`  
6. `DOCS_MANIFEST.yaml` (structure documentaire)  

============================================================  
📌 5. WORKFLOWS ET MODULES AUTONOMES (v4 → v12)  
============================================================  

| Module | Fonction | Status |
|--------|----------|--------|
| v4 — Self-Diagnosis | Analyse complète | ✔️ Actif |
| v5 — Auto-Repair | Corrige erreurs simples | ✔️ |
| v6 — Flutter Refactor | Optimisation architecture | ✔️ |
| v7 — UI Analyzer | Analyse via screenshots | ✔️ |
| v8 — Production Observer | Surveillance production | ✔️ |
| v9 — Predictive Engine | Prédiction de risques | ✔️ |
| v10 — Rollback Policy | Revert auto si échec | ✔️ |
| v11 — Auto-Documentation | Mise à jour docs | ✔️ |
| v12 — Cross-Agent Matrix | Coordination agents | ✔️ |

============================================================  
📌 6. PROCESSUS D’ARRIVÉE DU NOUVEL AGENT  
============================================================  

### ÉTAPE 1 — Lire l’état du projet  
→ `STATE_PROJECT.md` (mis à jour automatiquement)

### ÉTAPE 2 — Lire la TODO List  
→ `TASKS.md`

### ÉTAPE 3 — Vérifier zone autorisée avant action  
→ Si action prévue dans lib/ = REFUS AUTOMATIQUE

### ÉTAPE 4 — Vérifier build Flutter  
Commandes autorisées :  
```
flutter clean
flutter pub get
flutter build apk --release
```
(obligatoire dans le terminal intégré VS Code)

### ÉTAPE 5 — Mettre à jour la documentation  
Seulement dans :  
- `docs/`  
- `.github/workflows/`  
- `.patches/`  

============================================================  
📌 7. ACTIONS INTERDITES  
============================================================  

❌ Modifier le dossier `lib/`  
❌ Modifier le code Flutter UI/métier  
❌ Modifier les secrets GitHub  
❌ Déployer sans autorisation  
❌ Bypasser TITAN, OMEGA, SUPERVISOR ou GOVERNOR  

============================================================  
📌 8. CHECKLIST RAPIDE  
============================================================  

✔ Lire `STATE_PROJECT.md`  
✔ Lire `TASKS.md`  
✔ Respect zones interdites  
✔ Ne jamais toucher lib/  
✔ Toujours fournir fichiers COMPLETS si modifiés  
✔ Assurer continuité du projet  

============================================================  
📌 9. FIN DU DOCUMENT  
============================================================  

Bienvenue Agent.  
L’opération continue en PRO MODE — version 3.0.  
