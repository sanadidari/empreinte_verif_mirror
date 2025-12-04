✅ README.md — VERSION ENTERPRISE + MILITARY PRO (à coller dans la racine du projet)
🛡️ SANAD IDARI — EMPREINTE VERIF
Plateforme de vérification d’identité — Flutter Web • CI/CD GitHub • Vercel • Agents GPT PRO
📌 1. Description

Empreinte Verif est une plateforme moderne permettant :

🔍 Scan d’empreinte digitale (Android natif + Web)

🔐 Vérification d’identité via API sécurisée

🌐 Déploiement automatique sur Vercel

🛡️ Documentation militaire pour travail collaboratif multi-agents GPT

🏗️ Architecture stable, scalable, et maintenable

Ce projet est développé dans une approche ENTERPRISE avec :

✔ CI/CD GitHub Actions
✔ Repo privé + miroir public (pour lecture agent GPT)
✔ Documentation PRO strictement contrôlée
✔ Architecture prête pour les futures fonctionnalités Backend & Mobile

🚀 2. Fonctionnalités
✔ Déjà Implémenté

UI complète “Scanner l’empreinte”

Routing Web corrigé (aucune 404 interne)

Déploiement Vercel stable

Fichier vercel.json optimisé pour Flutter Web SPA

Fonts & assets optimisés

CI/CD GitHub → Vercel fonctionnel

Système miroir GitHub automatique (public → agents GPT)

🔄 En Développement

API Backend /scan

Gestion des empreintes (hash crypté)

Analyse biométrique

Token sécurisé d’authentification

🟦 À venir

Scan biométrique Android natif

Dashboard administrateur

Base de données cloud

Version mobile stable

Système de logs & monitoring

🧱 3. Architecture Globale
emp_verif/
 ├─ lib/                 # Code Flutter
 │   ├─ main.dart
 │   ├─ ui/
 │   └─ widgets/
 │
 ├─ web/                 # Entrée Flutter Web
 │   ├─ index.html
 │   ├─ flutter_bootstrap.js
 │   ├─ manifest.json
 │   ├─ icons/
 │   └─ assets/
 │
 ├─ build/web/           # Build généré automatiquement (ne jamais modifier)
 │
 ├─ docs/                # Documentation militaire utilisée par les agents GPT
 │
 ├─ .github/workflows/   # CI/CD (+ miroir)
 │   ├─ build_web.yml
 │   └─ mirror.yml
 │
 ├─ vercel.json          # Configuration SPA pour Flutter Web
 ├─ pubspec.yaml
 └─ README.md             # Ce fichier

🌐 4. Déploiement Web — Vercel

Ce projet utilise un pipeline CI/CD professionnel :

github push → build_web.yml → flutter build web → vercel deploy

📄 vercel.json (SPA obligatoire)
{
  "version": 2,
  "routes": [
    { "src": "/assets/(.*)", "dest": "/assets/$1" },
    { "src": "/icons/(.*)", "dest": "/icons/$1" },
    { "src": "/flutter_bootstrap.js", "dest": "/flutter_bootstrap.js" },
    { "src": "/main.dart.js", "dest": "/main.dart.js" },
    { "src": "/flutter.js", "dest": "/flutter.js" },
    { "src": "/canvaskit/(.*)", "dest": "/canvaskit/$1" },
    { "src": "/manifest.json", "dest": "/manifest.json" },
    { "src": "/version.json", "dest": "/version.json" },
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

🌍 Domaine final :
https://qrpruf.sanadidari.com

🔁 5. CI/CD — Pipelines GitHub
build_web.yml

Installe Flutter

Build Web en mode release

Déploie automatiquement sur Vercel

Contrôlé via VERCEL_TOKEN

mirror.yml

Utilise clé SSH MIRROR_DEPLOY_KEY

Force push vers repo public :
sanadidari/empreinte_verif_mirror

Permet aux agents GPT de lire la doc + code source

🤖 6. Agents GPT — Protocole Militaire

Le projet utilise un système Protocole Militaire GPT permettant :

Travail multi-agents sans erreur

Séquence d’actions strictes

Validation utilisateur obligatoire

Zéro improvisation

Lecture automatique GitHub dès le premier message

📌 Les agents doivent lire obligatoirement :

/docs/AGENT_PROTOCOL.md

/docs/STARTUP_CHECKLIST.md

/docs/CHECKLIST_MASTER.md

/docs/NEXT_ACTION.md

Ils doivent produire un rapport initial obligatoire avant tout travail.

⚙️ 7. Installation & Setup Local
Lancer le projet :
flutter pub get
flutter run

Build Web :
flutter build web --release

Déploiement :
git add .
git commit -m "deploy"
git push

🧭 8. Roadmap du Projet
Phase 1 — Déploiement Web

✔ Terminé

Phase 2 — Backend

API /scan

Analyse biométrique

Phase 3 — Mobile

Scan empreinte Android

Permissions & sécurité

Phase 4 — Admin Panel

Gestion utilisateurs

Dashboard sécurité

<<<<<<< HEAD
Projet initié par Sanad Idari.
---------
   mirror #1
=======
Phase 5 — Optimisations

SEO Flutter Web

Compression assets

CI/CD avancé

Logs & monitoring

👥 9. Contributions

Les nouveaux développeurs doivent lire :

/docs/AGENT_PROTOCOL.md

/docs/STARTUP_CHECKLIST.md

/docs/CHECKLIST_MASTER.md

/docs/ARCHITECTURE.md

/docs/TASKS.md

📌 Toutes les contributions passent par CI/CD + review stricte.

🧑‍💻 10. Auteur

Projet conçu et dirigé par :
Sanad Idari

Architecture soutenue par :
Système GPT Militaire PRO

🟦 FIN DU README PRO ENTERPRISE
>>>>>>> dfc0698 (Add military documentation system + updated README)
