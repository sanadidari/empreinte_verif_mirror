📄 AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE V1.0
Projet : empreinte_verif — Niveau : STRICT / ZERO-ERROR / CLASSIFIÉ
0. OBJECTIF

Ce protocole définit les règles obligatoires que tout agent GPT doit suivre pour travailler sur le projet empreinte_verif.
Aucune action n’est autorisée sans validation explicite de l'utilisateur.

1. SCANS OBLIGATOIRES AVANT TOUTE RÉPONSE

L’agent doit effectuer les 6 SCANS suivants avant de répondre à quoi que ce soit :

SCAN 1 — Accès au repo privé

📍 Repo : https://github.com/sanadidari/empreinte_verif

L’agent doit tester :

accès à la page du repo

accès aux fichiers RAW

présence du dossier /docs

présence du dossier /lib, /web, /android, /ios

Si l’accès échoue :
➡️ demander à l’utilisateur une solution (publicité temporaire / fichiers RAW / copier-coller).

SCAN 2 — Accès au repo miroir public

📍 Repo : https://github.com/sanadidari/empreinte_verif_mirror

L’agent doit vérifier :

accessibilité du repo public

existence du dossier /docs si exposé

cohérence des commits privés/publics

SCAN 3 — Lecture obligatoire des fichiers /docs

Ordre strict :

AGENT_PROTOCOL.md (ce fichier)

STARTUP_CHECKLIST.md

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE.md

TASKS.md

CHECKLIST_MASTER.md (si présent)

Interdit : répondre sans avoir lu tous ces fichiers.

SCAN 4 — Vérification branche main

L’agent doit récupérer :

Le dernier commit du repo privé

Le dernier commit du miroir

L'état du sync :

SYNC → tout est à jour

OUTDATED → miroir en retard

SCAN 5 — Lecture du fichier NEXT_ACTION.md

L’agent doit identifier la prochaine action uniquement à partir de ce fichier.

Interdit d’inventer une prochaine étape.

SCAN 6 — Vérification GitHub Actions

L’agent doit vérifier que :

.github/workflows/build_web.yml existe

.github/workflows/mirror.yml existe

Le secret MIRROR_DEPLOY_KEY est présent

Le workflow MIRROR est actif et valide

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

git add .
git commit -m "<message clair et court>"
git push


✔ mettre à jour :

STATE_PROJECT.md

TASKS.md

Le fichier modifié

4. INTERDICTIONS ABSOLUES

❌ Inventer un fichier
❌ Inventer une action
❌ Modifier plusieurs fichiers à la fois
❌ Faire des suppositions
❌ Travailler sans vérifier GitHub
❌ Continuer sans validation utilisateur
❌ Modifier build/web/

5. FIN DU PROTOCOLE

Aucun agent n'est autorisé à opérer sans appliquer ce document.
Toute violation doit être signalée immédiatement.

🟥 FIN DU FICHIER 1/10 — AGENT_PROTOCOL.md