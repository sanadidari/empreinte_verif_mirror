📄 CHECKLIST_MASTER.md — Version PRO
🧾 CHECKLIST MASTER — Sanad Idari — empreinte_verif

Cette checklist sert de référence centrale pour :

le démarrage d’un agent GPT

la vérification du projet

l’exécution d’une action

la mise à jour des documents

le suivi du déploiement

Elle doit être suivie strictement, dans l’ordre.

1. 🔵 CHECKLIST DÉMARRAGE — Agents GPT
✔ 1.1 Vérifier accès GitHub

Dépôt public ? → Oui / Non

Tester URLs RAW

Si échec → demander à l’utilisateur : rendre public / raw / coller docs

✔ 1.2 Lire tous les fichiers /docs

AGENT_START.md

AGENT_STARTUP_CHECKLIST.md

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE_VERCEL.md

TASKS.md

CHECKLIST_MASTER.md

✔ 1.3 Vérifier le code Flutter

pubspec.yaml

lib/

web/

Compatibilité Flutter Web

Présence vercel.json (si utilisé)

✔ 1.4 Générer la première réponse (obligatoire)

Résumé du projet

Résumé de l’état actuel

Next Action

Plan étape 1

Demander validation

2. 🔵 CHECKLIST EXÉCUTION ACTION

Pour chaque action :

✔ 2.1 Proposer une seule action

→ Tout doit commencer par une proposition.

✔ 2.2 Attendre validation utilisateur

→ Jamais exécuter sans validation explicite.

✔ 2.3 Exécuter l’action

→ Fournir fichiers complets (si modification)

✔ 2.4 Mise à jour /docs

Mettre à jour :

STATE_PROJECT.md

TASKS.md

fichier(s) modifié(s)

✔ 2.5 Indiquer commandes Git à exécuter

Exemple :

git add .
git commit -m "update: déploiement Vercel"
git push origin main

3. 🔵 CHECKLIST DÉPLOIEMENT — Flutter Web → Vercel
✔ 3.1 Build Flutter Web
flutter build web --release

✔ 3.2 Importation dans Vercel

Import GitHub

Framework : Other

Build Command : flutter build web --release

Output : build/web

✔ 3.3 Tester

Aucune page blanche

trunk logs OK

assets OK

✔ 3.4 DNS

qrpruf.sanadidari.com → CNAME vers Vercel

✔ 3.5 Mise à jour /docs
STATE_PROJECT.md
TASKS.md
HISTORY.md (optionnel)

4. 🔵 CHECKLIST MAINTENANCE
✔ 4.1 Vérifier :

Structure Flutter

Dépendances

Logs Vercel

Propreté du repo

Cohérence des docs

✔ 4.2 Planifier :

SEO Flutter Web

Documentation finale

Amélioration CI/CD

✔ FIN DU FICHIER