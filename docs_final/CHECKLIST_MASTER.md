📄 CHECKLIST_MASTER.md — GLOBAL OPERATION CHECKLIST (GOC-1)
Projet : empreinte_verif — Mode : MILITAIRE / ZERO-ERROR / STRICT

Cette checklist est la référence suprême.
Elle rassemble toutes les vérifications, tous les scans, toutes les étapes, que chaque agent GPT doit exécuter sans exception.

Aucun agent ne peut commencer à travailler sans valider l’intégralité de ce fichier.

🟥 1. SCANS INITIAUX — Obligatoires avant toute réponse
✔ SCAN A — Repo privé

Accès à : https://github.com/sanadidari/empreinte_verif

Lecture RAW

Dossier /docs accessible

Dossiers /lib + /web présents

Workflow .github/workflows présent

Dernier commit récupéré

✔ SCAN B — Repo miroir public

Accès à : https://github.com/sanadidari/empreinte_verif_mirror

Lecture des fichiers exposés

Vérification commit

Statut : SYNC / OUTDATED

✔ SCAN C — Lectures docs (ordre strict)

AGENT_PROTOCOL.md

STARTUP_CHECKLIST.md

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE.md

TASKS.md

CHECKLIST_MASTER.md

Si un fichier manque → STOP.

🟦 2. STRUCTURE PROJET — Vérification
✔ Fichiers critiques

pubspec.yaml

vercel.json

index.html

flutter_bootstrap.js

manifest.json

version.json

✔ Répertoires critiques

/lib

/web

/assets

/.github/workflows

🟧 3. CI/CD — Vérification complète
✔ build_web.yml

Flutter installé

flutter build web --release

Output → build/web

Aucune erreur dans logs

✔ mirror.yml

Clé MIRROR_DEPLOY_KEY valide

Connexion SSH au repo miroir

Force push fonctionnel

Aucune erreur key required

🟩 4. SECRETS — Contrôle strict
✔ Secret VERCEL_TOKEN

Présent

Correct

Non expiré

✔ Secret MIRROR_DEPLOY_KEY

Présent

Format valide

Pas d’espaces supplémentaires

Pas de lignes vides

🟦 5. VERCEL — Contrôle complet
✔ Projet

Connecté au repo privé

Framework = Other

Build Command = flutter build web --release

Output Directory = build/web

✔ Routage SPA

vercel.json doit contenir :

{ "src": "/(.*)", "dest": "/index.html" }

✔ Domaine

qrpruf.sanadidari.com résout correctement

CNAME → vercel-dns-017.com

SSL actif

🟨 6. NEXT ACTION — Vérification

L’agent doit :

Lire NEXT_ACTION.md

Extraire la prochaine action unique

Ne pas en inventer

Ne pas anticiper

🟫 7. RAPPORT INITIAL — Format obligatoire

L’agent doit produire EXACTEMENT :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

Souhaites-tu valider l’exécution de l’étape 1 ?


Puis STOP.

🟩 8. EXÉCUTION STRICTE — Une seule action par réponse

Processus obligatoire :

1️⃣ Proposer
2️⃣ Attendre validation
3️⃣ Exécuter
4️⃣ Fournir fichier complet modifié
5️⃣ Mettre à jour :

STATE_PROJECT.md

TASKS.md

🟥 9. CONDITIONS D’ARRÊT — Immediate STOP

Un agent doit arrêter toute action si :

accès GitHub impossible

fichier docs manquant

incohérence détectée

workflow cassé

secret manquant ou invalide

miroir OUTDATED sans justification

🟦 10. VALIDATION FINALE

Un agent n’est considéré complètement initialisé que lorsqu’il a validé tous les points de cette checklist.

🟥 FIN DU FICHIER 10/10 — CHECKLIST_MASTER.md