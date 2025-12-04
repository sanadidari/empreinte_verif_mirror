📄 STATE_PROJECT.md — Version PRO
🟦 État du Projet — Sanad Idari — empreinte_verif

Dernière mise à jour : (à remplir par l’agent ou l’utilisateur après chaque action)
Source de vérité : /docs + branche main du repo.

1. 🔷 Aperçu général du projet

Le projet Sanad Idari — empreinte_verif est une application Flutter Web, hébergée sur Vercel, utilisant un pipeline :

GitHub (branche main) → Vercel Build → Déploiement Web


L’objectif actuel : fournir une interface stable permettant la vérification administrative (QR/empreinte).

2. 🔷 Stack technique
✔ Framework

Flutter Web

Dart

✔ Hébergement

Vercel

Domaine prévu :
https://qrpruf.sanadidari.com

✔ Pipeline

GitHub → Vercel (branche main)

3. 🔷 Structure du dépôt GitHub (attendue)

pubspec.yaml

lib/ (code Flutter)

web/ (index.html, assets)

docs/ (documentation agent)

vercel.json (optionnel selon stratégie)

L’agent doit vérifier l’existence de ces éléments lors du démarrage.

4. 🔷 Vercel — Configuration attendue
Build Command :
flutter build web --release

Output Directory :
build/web

Framework :
Other

DNS :

qrpruf.sanadidari.com → CNAME vers Vercel

5. 🔷 Historique migration

Hébergement HostPapa supprimé

Watchdog supprimé

Scripts PowerShell supprimés

Pipeline Flutter Web → Vercel initié

Système PRO agents GPT activé

Documentation /docs normalisée

6. 🔷 Points de vigilance (risques potentiels)

Page blanche Flutter Web en cas de mauvaise configuration Vercel

Routing SPA → nécessite routes dans vercel.json

Flutter Web parfois lent à charger : vérifier assets compression

Logs Vercel à surveiller après premier déploiement

7. 🔷 État GitHub

Repo : sanadidari/empreinte_verif

Branche active : main

Dernière vérification : (à remplir)

État général du repo : OK

Accès GitHub : fonctionnel (le repo doit être public ou RAW accessible)

8. 🔷 STATE_CODE — État du code Flutter

Ce bloc doit être mis à jour par l’agent après chaque lecture du repo.

pubspec.yaml → OK

lib/ → présent

web/ → présent

Compatibilité Flutter Web → OK

Script build → fonctionnel

Aucun problème critique détecté

9. 🔷 STATE_INFRA — État de l’infrastructure

Vercel → prêt pour import

Domaine → prêt

DNS → OK

Pipeline GitHub → OK

10. 🔷 STATE_DOCS — État documentation

Tous les fichiers /docs présents

Version PRO → activée

Règle d’Or → active

Agents → fonctionnent avec PRO MODE strict

11. 🔷 Résumé des tâches
✔ Terminées

Migration HostPapa → Vercel

Suppression scripts & watchdog

Mise en place /docs

Système PRO agents GPT

Vérification GitHub

🔄 En cours

Configuration du déploiement Flutter Web sur Vercel

🟩 À faire

Import repo dans Vercel

Framework : Other

Build command : flutter build web --release

Output : build/web

Premier déploiement

Mise à jour STATE_PROJECT.md + TASKS.md

⛔ Bloquées

Aucune

✔ FIN DU FICHIER