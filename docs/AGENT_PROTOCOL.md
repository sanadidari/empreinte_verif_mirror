# AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE V3.0
Projet : empreinte_verif — Niveau : STRICT / ZERO-ERROR / CLASSIFIÉ

0. OBJECTIF

Ce protocole définit les règles obligatoires que tout agent GPT doit suivre pour travailler sur le projet empreinte_verif.
Aucune action n’est autorisée sans validation explicite de l'utilisateur, sauf pour les modules automatiques décrits ci-dessous (v4+), et uniquement si le RUN automatique a été validé par le responsable.

1. SCANS OBLIGATOIRES AVANT TOUTE RÉPONSE

L’agent doit effectuer les 6 SCANS suivants avant de répondre à quoi que ce soit :
... (contenu inchangé : SCAN 1 → SCAN 6) ...

2. RAPPORT INITIAL — RÉPONSE OBLIGATOIRE DE L’AGENT

Après les 6 scans, l’agent doit produire exactement :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste des fichiers lus>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <contenu extrait de NEXT_ACTION.md>

-----------------------------------------------------
QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

Puis s’arrêter.

3. RÈGLE D’OR : UNE SEULE ACTION PAR ÉTAPE

L’agent doit :
✔ attendre validation
✔ exécuter une action
✔ fournir le fichier complet modifié
✔ proposer les commandes git :

git add <file>
git commit -m "<message clair et court>"
git push

✔ mettre à jour :
STATE_PROJECT.md
TASKS.md
Le fichier modifié

4. INTERDICTIONS ABSOLUES

❌ Inventer un fichier
❌ Inventer une action
❌ Modifier plusieurs fichiers à la fois sans validation
❌ Faire des suppositions
❌ Travailler sans vérifier GitHub
❌ Continuer sans validation utilisateur
❌ Modifier build/web/

5. MODULES D’AUTONOMIE OFFICIELS (v4 → v12)

Ces modules sont autorisés par défaut (après validation initiale du responsable) et peuvent être exécutés automatiquement par les agents. Leur existence doit être documentée et chaque exécution doit produire un rapport horodaté dans STATE_PROJECT.md / HISTORY.md.

## v4.0 — SELF-DIAGNOSIS MODE
But : diagnostiquer automatiquement l’état du repo, workflows et déploiement.
Fonctions principales :
- scan GitHub Actions, secrets, vercel token
- test HTTP/SSL basique
- analyse d’artefacts build/web
- rapport automatique (logs + recommandations)

## v5.0 — AUTO-REPAIR
But : appliquer correctifs non invasifs (scripts / formatting / restore).
Règles :
- propose d’abord la correction en draft (PR local)
- n’exécute que si la correction est non destructive et validée par AGENT_PROTOCOL rules
- log complet des modifications et rollback possible

## v6.0 — INTELLIGENCE FLUTTER AVANCÉE
But : analyser le code Flutter pour erreurs courantes, performances et compatibilités.
Fonctions :
- static analysis (pub, dart analyze)
- checks sur main.dart.js size, assets presence
- suggestions de refactor (non-appliquées sans validation)

## v7.0 — ANALYSE UI AVEC SCREENSHOTS
But : comparer rendu UI attendu vs rendu actuel (via screenshots fournis ou screenshot-tests).
Règles :
- l’agent peut analyser images fournies automatiquement
- signale divergences visuelles (layout shift, assets missing)
- ne modifie pas les assets sans validation

## v8.0 — OBSERVATEUR DE PRODUCTION 24/24
But : surveiller disponibilité, erreurs HTTP, taux d’erreur, et logs Vercel.
Fonctions :
- heartbeat checks
- alerting (issues/tickets)
- daily summary dans STATE_PROJECT.md

## v9.0 — PREDICTIVE FAILURE ENGINE (IA PRÉDICTIVE)
But : prédire régressions et risques avant déploiement.
Fonctions :
- modèle heuristique + rules-based (patterns connus)
- probabilité d’échec estimée par module (LOW/MED/HIGH)
- recommande actions préventives (ex: add fallback, update plugin)

## v10.0 — SMART ROLLBACK SYSTEM
But : rollback automatique sur déploiement critique.
Règles :
- rollback uniquement si seuil d’erreurs dépassé (configurable)
- journal détaillé des raisons et commits ciblés
- notification obligatoire au responsable

## v11.0 — AUTO-DOCUMENTATION MACHINE
But : maintenir docs cohérentes automatiquement.
Fonctions :
- mise à jour STATE_PROJECT.md, HISTORY.md, TASKS.md après actions
- synthèse des changements technique (résumé 3-5 lignes)
- draft commit disponible pour validation si sensitif

## v12.0 — CROSS-AGENT COORDINATION
But : orchestration multi-agents.
Fonctions :
- agents spécialisés s’échangent des messages structurés
- orchestre plan d’action multi-étapes (scan → fix → test → deploy)
- chaque orchestration génère un plan visible dans NEXT_ACTION.md

6. EXIGENCES DE SÉCURITÉ POUR LES MODULES AUTONOMES
- Toutes modifications automatiques doivent être traçables et revertables.
- Les secrets ne peuvent être lus que par workflows et ne doivent jamais être exposés.
- Toute action modifiant code sensible (auth, keys, build scripts) doit déclencher une alerte humaine immédiate.

7. FIN
Aucune violation de ce protocole n’est acceptée. Les agents qui violent les règles seront sanctionnés (log + blocage).

🟥 FIN DU FICHIER — AGENT_PROTOCOL.md v3.0
