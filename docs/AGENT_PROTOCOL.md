# AGENT_PROTOCOL.md — PROTOCOL MILITAIRE V3.0 (FULL INTELLIGENCE)

Projet : empreinte_verif — Niveau : STRICT / ZERO-ERROR / CLASSIFIÉ

## 0. OBJECTIF
Ce protocole définit les règles obligatoires que tout agent GPT doit suivre pour travailler sur le projet empreinte_verif.
Aucune action n’est autorisée sans validation explicite de l’utilisateur, sauf exceptions décrites (Mode 4 autorisé par le propriétaire).

## 1. SCANS OBLIGATOIRES AVANT TOUTE RÉPONSE
L’agent effectue 6 scans obligatoires (privé, miroir, docs, branches, NEXT_ACTION, GitHub Actions).
→ (description inchangée et obligatoire)

## 2. MODE D'AUTONOMIE (Mode 4 — Mix IA + Commit + Timer)
Le propriétaire a autorisé explicitement Mode 4 (OUI MODE 4). Dans ce mode :
- Agents peuvent exécuter automatiquement les tâches de diagnostic, réparation non destructive, build et déploiement si :
  - les workflows d’autodiagnostic retournent "OK" ou mesures réparées.
  - aucun secret sensible n’est exposé.
- Agents DOIVENT journaliser chaque action dans HISTORY.md et STATE_PROJECT.md.
- Agents DOIVENT demander validation pour toute modification manuelle de code source applicatif (lib/*) qui change la logique métier.
- Autorisé : modifications automatisées non invasives (scripts, docs, workflows).
- Interdit : committer des secrets, modifier build/web ou ajouter des clés privées.

## 3. RAPPORT INITIAL — FORMAT OBLIGATOIRE
Après les scans, l’agent produira exactement :
[PROTOCOL INITIAL REPORT – LEVEL RED]
1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

Puis attendre validation sauf si Mode 4 est actif et la NEXT_ACTION est 'Run self-diagnosis / Auto-deploy' — dans ce cas l’agent peut exécuter et ensuite rapporter.

## 4. RÈGLES D'OR
- Toujours fournir le fichier complet corrigé.
- Une seule action par étape sauf opérations automatisées approuvées (Mode 4).
- Jamais exposer les secrets.

## 5. MODULES AUTONOMES (v4-v12)
Le système face à Mode 4 utilise un ensemble de modules autonomes :
- v4 — Self Diagnosis (scan HTTP/SSL, workflows, assets)
- v5 — Auto-Repair (corriger manifestes, petits fixes, re-generate assets)
- v6 — Intelligence Flutter Avancée (analyse static/dartfmt, suggestion refactor)
- v7 — UI Analysis (screenshots, diff visuel, accessibility checks)
- v8 — Production Observer (24/7 health checks)
- v9..v12 — Extended automation (auto-refactor rules, rollback manager, security hardening, telemetry)
Les agents doivent enregistrer chaque exécution dans STATE_PROJECT.md et HISTORY.md.

## 6. CONDITIONS D'ARRÊT
Agent stop immédiatement si :
- un secret manquant ou exposé
- build produit erreur critique
- miroir non disponible
- directive humaine explicite : "STOP"

## 7. MISE EN PRATIQUE
- Les workflows GitHub appropriés doivent exister (.github/workflows/auto_deploy.yml).
- Les scripts doivent être non-interactifs et idempotents.
- Les logs doivent être produits à chaque étape.

FIN — AGENT_PROTOCOL.md v3.0 (Mode 4 activé)
