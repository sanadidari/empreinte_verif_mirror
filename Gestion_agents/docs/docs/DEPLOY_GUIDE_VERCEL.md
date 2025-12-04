📄 DEPLOY_GUIDE_VERCEL.md — Version PRO
🚀 Guide de Déploiement — Flutter Web sur Vercel

Projet : Sanad Idari — empreinte_verif

Ce guide décrit toutes les étapes pour déployer l'application Flutter Web sur Vercel de manière fiable, reproductible et conforme au pipeline PRO.

1. 🔷 Pré-requis
✔ Flutter installé

Vérifier votre installation Flutter :

flutter doctor


Flutter doit être configuré pour le Web :

flutter config --enable-web

✔ Dépôt GitHub prêt

Le dépôt doit contenir :

pubspec.yaml

lib/

web/

docs/

(optionnel) vercel.json

✔ Branche utilisée pour déploiement
main

✔ Éviter :

Scripts locaux PowerShell

Déploiement manuel FTP

HostPapa / VPS

2. 🔷 Étape 1 — Build Flutter Web

Exécuter le build :

flutter build web --release


Output attendu :

build/web


Ce dossier sera utilisé par Vercel.

3. 🔷 Étape 2 — Import du projet dans Vercel

Accéder à :
https://vercel.com/import

Puis :

Choisir Import GitHub Project

Sélectionner :
sanadidari/empreinte_verif

Framework → Other

Build Command :

flutter build web --release


Output Directory :

build/web


Lancer le déploiement

4. 🔷 Étape 3 — Tester le déploiement Vercel

Vérifier :

✔ Lien Preview fonctionne

Pas de page blanche

Pas d’erreur console

Pas de 404

✔ Routing SPA

Si besoin, utiliser vercel.json :

{
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

✔ Assets

main.dart.js chargé

Aucun asset missing dans console

5. 🔷 Étape 4 — DNS & Domaine

Configuration du domaine :

qrpruf.sanadidari.com


Type : CNAME
Cible : cname.vercel-dns.com

6. 🔷 Étape 5 — Mise à jour documentation

Après un déploiement réussi, mettre à jour :

✔ STATE_PROJECT.md

Nouveau statut

Date

Lien du déploiement

✔ TASKS.md

Marquer le déploiement comme terminé

Déplacer la next action dans “Terminé”

✔ HISTORY.md

Ajouter entrée “Premier déploiement Vercel”

7. 🔷 Troubleshooting (problèmes courants)
❌ Page blanche

Build incorrect → refaire build

vercel.json manquant → ajouter routing

assets non trouvés → vérifier build/web/assets/*

❌ Vercel Error : Flutter not found

→ Ajouter installation de Flutter dans settings
→ Ou utiliser une config custom (optionnel)

❌ 404 / routing cassé

→ SPA → toujours fallback sur /index.html

✔ FIN DU FICHIER