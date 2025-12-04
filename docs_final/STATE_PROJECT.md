📄 STATE_PROJECT.md — PROJECT STATUS INTEL REPORT (PSIR-1)
Projet : empreinte_verif — Classification : STRICT / TOP PRIORITY / LIVE
🕓 Dernière mise à jour :

(À renseigner par l’agent après chaque action validée)

🔷 1. Aperçu Opérationnel

Le projet empreinte_verif est une application Flutter Web déployée via :

GitHub (privé) → GitHub Actions → Vercel → Domaine qrpruf.sanadidari.com


Un Système Militaire d’Agents GPT est en place pour assurer :

Cohérence documentation

Exécution strictement séquentielle

Déploiement fiable

Maintenabilité long terme

Zéro improvisation

🔷 2. Stack Technique
Framework

Flutter Web (Dart 3.x)

Responsive UI

SPA Architecture

Hébergement

Vercel (Other framework)

CNAME DNS → HostPapa → Vercel

Pipeline CI/CD

build_web.yml

mirror.yml

Deploy automatique

Domaine
qrpruf.sanadidari.com
www.qrpruf.sanadidari.com

🔷 3. Structure Repository (Attendue & Validée)
/lib                → Code Flutter (UI + logique)
/web                → Entrée Flutter Web (HTML + JS)
/docs               → Documentation officielle (mode militaire)
/build/web          → Build généré automatiquement
/.github/workflows → Pipelines CI/CD
pubspec.yaml        → Dépendances
vercel.json         → Routage SPA


L’agent doit vérifier cette structure à chaque démarrage.

🔷 4. Infrastructure Vercel
Build Command :
flutter build web --release

Output :
build/web

Routage SPA :
{ "src": "/(.*)", "dest": "/index.html" }

DNS :

CNAME : qrpruf → vercel-dns-017.com

SSL actif

🔷 5. Intelligence Historique (Résumée)

HostPapa abandonné définitivement

Migration vers Vercel effectuée

Mise en place du pipeline GitHub Actions

Problèmes de clés SSH et miroir résolus

Documentation réécrite en PRO MODE

Mise en place du protocole militaire GPT

Système miroir entièrement fonctionnel

🔷 6. Points de Vigilance

Page blanche Flutter Web

Problème de base-href

Assets manquants

Mauvaise configuration vercel.json

Mauvaise installation MIRROR_DEPLOY_KEY

Déploiement cassé par mauvaise version de Flutter

🔷 7. État GitHub (Repos)
Repo privé : empreinte_verif

Accès : OK

Branche : main

Workflow : build_web.yml → OK

Workflow : mirror.yml → OK

Secrets :

VERCEL_TOKEN → OK

MIRROR_DEPLOY_KEY → OK

Repo public : empreinte_verif_mirror

Déployé via SSH

Synchro via mirror.yml

Statut sync : (à mettre à jour par l’agent)

🔷 8. STATE_CODE — État du code Flutter

/lib → Stable

/web → Stable

index.html → Compatible Vercel

flutter_bootstrap.js → OK

manifest.json → OK

icons/* → OK

Compatibilité Flutter Web : OK

Build stable : OUI

🔷 9. STATE_INFRA — État Infrastructure

GitHub Actions → fonctionnel

Miroir SSH → fonctionnel

DNS → fonctionnel

Pipeline complet → OPÉRATIONNEL

🔷 10. STATE_DOCS — État Documentation

Protocole militaire appliqué

/docs complet

Lecture obligatoire validée par agents GPT

Cohérence assurée

🔷 11. Mission Log (Tâches)
✔ Terminé

Migration HostPapa → Vercel

Pipeline CI/CD

Correction SSH Mirror

Documentation Militaire v1.0

🔄 En cours

Déploiement Flutter Web (NEXT_ACTION)

🟩 À faire

Tester intégration pipeline complet

Mettre à jour docs après déploiement final

⛔ Bloqué

Rien

🟥 FIN DU FICHIER 4/10 — STATE_PROJECT.md