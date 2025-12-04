📄 ARCHITECTURE.md — Version PRO
🏗️ Architecture — Sanad Idari — empreinte_verif

Voici l’architecture officielle du projet, conforme à la stack Flutter Web et au pipeline Vercel.

1. 🔷 Vue d’ensemble

Le projet Sanad Idari — empreinte_verif suit l’architecture suivante :

Flutter Web → GitHub → Vercel Build → Vercel Hosting → Domaine final


L’application est une Single Page Application (SPA) compilée par Flutter Web.

2. 🔷 Pipeline complet (schéma)
        ┌───────────────────┐
        │    Développeur    │
        └─────────┬─────────┘
                  │ git push main
                  ▼
        ┌───────────────────┐
        │      GitHub       │
        └─────────┬─────────┘
                  │ Fetch & Build
                  ▼
        ┌────────────────────────────────┐
        │             Vercel             │
        │  - Framework: Other            │
        │  - Build: flutter build web   │
        │  - Output: build/web          │
        └─────────┬──────────────────────┘
                  │ Serveur CDN global
                  ▼
        ┌───────────────────┐
        │   Utilisateurs    │
        └───────────────────┘

3. 🔷 Structure du dépôt GitHub
/
├── lib/                    # Code Flutter (widgets, pages, provider…)
├── web/                    # index.html + favicon + icons
├── build/                  # Généré après build
│     └── web/              # Output final pour Vercel
├── docs/                   # Documentation PRO des agents GPT
├── pubspec.yaml            # Dépendances Flutter
└── vercel.json (optionnel)

4. 🔷 Détails du Build Flutter Web
Build command :
flutter build web --release

Output :
build/web

Caractéristiques Flutter Web :

Génère une SPA avec index.html unique

Utilise main.dart.js (minifié)

Assets dans /assets/

DOIT avoir un fallback routing vers /index.html

5. 🔷 Configuration Vercel
Framework :
Other

Build command :
flutter build web --release

Output :
build/web

Routing SPA :

(Nécessaire si vercel.json est utilisé)

{
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

6. 🔷 Infrastructure DNS

Domaine final :

qrpruf.sanadidari.com


Configuration DNS :

Type : CNAME
Host : qrpruf
Value : cname.vercel-dns.com
TTL  : automatique

7. 🔷 Contraintes Flutter Web (Notes techniques)

Le chargement initial peut être lent → activer compression GZIP/Brotli de Vercel

Le routing doit absolument pointer vers /index.html

Les assets doivent exister dans le chemin /assets/

Si web/index.html est modifié, refaire un build complet

Le SEO Flutter Web est limité par nature (à documenter plus tard)

8. 🔷 Risques et Points de vigilance

Page blanche si index.html n’est pas trouvé

Erreur Vercel si build ne trouve pas Flutter SDK

Problème routing si vercel.json absent

Build cassé si pubspec.yaml contient erreurs

404 si assets mal générés après build

✔ FIN DU FICHIER