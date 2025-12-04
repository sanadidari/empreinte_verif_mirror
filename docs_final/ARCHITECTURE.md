📄 ARCHITECTURE.md — SYSTEM ARCHITECTURE DOSSIER (SAD-1)
Projet : empreinte_verif — Classification : CONFIDENTIEL / PRO MODE / ZERO-ERROR
🧱 1. VISION GLOBALE — ARCHITECTURE DU SYSTÈME

L’application empreinte_verif repose sur une architecture en 4 couches sécurisées :

[1] Flutter Web (UI)
[2] GitHub Repo Privé (Source Code)
[3] GitHub Actions (Build + Mirror)
[4] Vercel (Hébergement + CDN)


Cette architecture garantit :

Déploiement automatisé

Haute fiabilité

Séparation stricte des environnements

Lecture propre pour les agents GPT via repo miroir

🟦 2. ARCHITECTURE LOGICIELLE — FLUTTER
2.1 Structure interne Flutter
/lib
  ├── main.dart
  ├── ui/
  │     ├── home.dart
  │     └── widgets/
  ├── services/
  └── utils/

web/
  ├── index.html
  ├── flutter_bootstrap.js
  ├── icons/
  ├── assets/
  ├── manifest.json
  └── version.json

2.2 Flutter Web Requirements

Projet configuré pour Web (flutter config --enable-web)

Utilisation du moteur CanvasKit ou HTML selon build

Configuration SPA (Single Page App) dans Vercel

2.3 Règles strictes

❌ Ne jamais modifier build/web

✔ Toujours modifier /lib et /web

✔ Toujours builder avec :

flutter build web --release

🟦 3. ARCHITECTURE INFRASTRUCTURE
3.1 GitHub – Repo Privé

Contient :

Code source complet
Documentation /docs
Workflows CI/CD
vercel.json
pubspec.yaml


C’est la source de vérité absolue.

3.2 GitHub – Repo Public Miroir
sanadidari/empreinte_verif_mirror


Utilisé pour :
✔ Lecture par agents GPT
✔ Transparence documentaire
✔ Séparation sécurité / visibilité

Le miroir est mis à jour via :

mirror.yml → SSH → push --force

3.3 GitHub Actions (CI/CD)

Deux workflows critiques :

A — build_web.yml (déploiement Vercel)

Fonction :

Installe Flutter

Compile l'app

Déploie sur Vercel via token secret

B — mirror.yml (miroir public)

Fonction :

Installe clé SSH MIRROR_DEPLOY_KEY

Force push vers repo public

3.4 Vercel — Hébergement Web

Vercel sert l’application Flutter Web à partir de :

build/web


Avec configuration SPA :

"routes": [
  { "src": "/(.*)", "dest": "/index.html" }
]


Domaines vérifiés :

qrpruf.sanadidari.com
www.qrpruf.sanadidari.com


DNS :

HostPapa (gestion DNS)

CNAME → vercel-dns-017.com

🟦 4. ARCHITECTURE SÉCURITÉ
4.1 Secrets GitHub

Obligatoires :

VERCEL_TOKEN
MIRROR_DEPLOY_KEY

4.2 SSH Keys

Clés nécessaires au miroir :

Deploy Key (public) → ajoutée au repo miroir
MIRROR_DEPLOY_KEY (private) → secret du repo privé

4.3 Interdictions

❌ Jamais exposer la clé SSH privée

❌ Jamais committer id_ed25519 dans le repo

❌ Jamais stocker code non buildé dans build/web

🟦 5. ARCHITECTURE PIPELINE (Résumé Opérationnel)
[DEV] 
   ↓ git push main
[GitHub Actions – build_web.yml]
   ↓ flutter build web
   ↓ vercel deploy
[Vercel]
   ↓ CDN global + routing SPA
[UTILISATEUR FINAL]

Miroir :
push main
   ↓ mirror.yml
   ↓ SSH sync
repo public miroir mis à jour

🟦 6. Risques Techniques Identifiés

Page blanche Flutter → souvent base-href cassée

Absence de assets → mauvais build

Échec Vercel → missing VERCEL_TOKEN

Miroir cassé → mauvaise clé SSH

Problèmes DNS → propagation CNAME lente

🟥 FIN DU FICHIER 6/10 — ARCHITECTURE.md