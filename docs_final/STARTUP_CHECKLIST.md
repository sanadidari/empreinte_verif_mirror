📄 STARTUP_CHECKLIST.md — STARTUP PROTOCOL v1.0
Projet : empreinte_verif — Agents GPT — Strict Military Mode
🎯 Objectif

Cette checklist définit les actions obligatoires, dans l’ordre, qu’un agent GPT doit effectuer au démarrage avant toute analyse ou réponse.

Aucune étape ne peut être sautée.
Aucune réponse ne peut être produite avant la validation intégrale de cette checklist.

✅ 1. Vérification accès GitHub
1.1 — Repo privé

URL :
https://github.com/sanadidari/empreinte_verif

L’agent doit vérifier :

accès page repo

accès RAW

existence du dossier /docs

existence du dossier /lib

existence du dossier /web

existence du dossier .github/workflows

dernier commit hash

Si accès impossible → STOP → demander fichiers RAW ou copie manuelle.

1.2 — Repo miroir public

URL :
https://github.com/sanadidari/empreinte_verif_mirror

L’agent doit vérifier :

accessibilité

cohérence avec le repo privé

dernier commit

statut de synchronisation : SYNC ou OUTDATED

✅ 2. Lecture obligatoire des fichiers docs

Ordre strict et obligatoire :

AGENT_PROTOCOL.md

STARTUP_CHECKLIST.md (ce fichier)

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE.md

TASKS.md

CHECKLIST_MASTER.md (si présent)

Aucun travail ne peut commencer tant que tous ces fichiers ne sont pas lus.

✅ 3. Vérification structure du projet

L’agent vérifie :

pubspec.yaml existe

/lib non vide

/web contient index.html et assets

/build/web ignoré

/android et /ios présents

.github/workflows/* contient :

build_web.yml

mirror.yml

✅ 4. Vérification des secrets GitHub Actions

Dans le repo privé :

MIRROR_DEPLOY_KEY → doit exister

VERCEL_TOKEN → doit exister

interdire toute erreur de saisie ou nom incorrect

L’agent doit signaler :

clés manquantes

clés invalides

clés mal formatées

✅ 5. Vérification pipeline GitHub Actions

L’agent vérifie :

Build pipeline :

build_web.yml

command: flutter build web --release

output: build/web

runner: ubuntu-latest

Mirror pipeline :

mirror.yml

clé SSH détectée

known_hosts présent

remote mirror configuré

Si un fichier est incorrect :
→ STOP
→ demander validation avant correction.

✅ 6. Analyse du fichier NEXT_ACTION.md

L’agent doit lire et extraire :

LA prochaine action

Seulement ce qui est écrit dans le fichier

Sans inventer aucune étape

🚫 Interdit : proposer une action qui n'est pas écrite.

✅ 7. Préparation du RAPPORT INITIAL

L’agent doit rendre le rapport suivant :

[STARTUP CHECK COMPLETE]

1. Repo privé: OK/NON
2. Repo miroir: OK/NON
3. Docs chargés: <liste>
4. Dernier commit privé: <hash>
5. Dernier commit miroir: <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <ligne copiée depuis NEXT_ACTION.md>

Souhaites-tu valider l'étape 1 ?


Puis s’arrêter obligatoirement.

🟥 FIN DU FICHIER 2/10 — STARTUP_CHECKLIST.md