📄 NEXT_ACTION.md — Version PRO
🔥 NEXT ACTION — Déploiement Flutter Web sur Vercel

Ceci est la prochaine action officielle, validée, bloquante, et unique pour le projet Sanad Idari — empreinte_verif.

1. 🎯 Objectif

Déployer la version Flutter Web du projet sur Vercel, en utilisant :

Pipeline : GitHub → Vercel

Build : flutter build web --release

Output : build/web

Framework : Other

2. 📌 Pourquoi cette action ?

Selon STATE_PROJECT.md et TASKS.md :

Migration HostPapa → Vercel terminée

Nettoyage environnement terminé

Système PRO actif

Code Flutter prêt pour compilation

/docs stabilisé

➡️ Le projet est techniquement prêt pour un premier déploiement Flutter Web.

3. 🧱 Prérequis

Avant de commencer :

Le repo doit être lisible :
https://github.com/sanadidari/empreinte_verif

Le dossier web Flutter doit exister

pubspec.yaml doit être valide

Branch main à jour

Code compatible Flutter Web

L’agent doit avoir lu tous les fichiers /docs

4. 🚀 Étapes exactes du déploiement Vercel
1️⃣ Aller sur :

https://vercel.com/import

2️⃣ Choisir Import GitHub Repository
3️⃣ Sélectionner le repo :

sanadidari/empreinte_verif

4️⃣ Framework → Other
5️⃣ Build Command :
flutter build web --release

6️⃣ Output Directory :
build/web

7️⃣ Lancer le déploiement
8️⃣ Tester le preview link :

routing

performance

erreurs console

9️⃣ Après succès → mettre à jour :

STATE_PROJECT.md

TASKS.md

Historique (HISTORY.md, optionnel)

5. 📘 Définition de Done (critères de succès)

L’action est considérée réussie quand :

Le déploiement Vercel s'exécute sans erreur

Le site est accessible sur l’URL preview fournie par Vercel

Le routing fonctionne

Aucune page blanche

Aucun crash Flutter Web

Les fichiers /docs sont mis à jour

6. ✍️ Fichiers à mettre à jour après cette action
Obligatoires :

STATE_PROJECT.md

TASKS.md

Optionnel :

HISTORY.md

✔ FIN DU FICHIER