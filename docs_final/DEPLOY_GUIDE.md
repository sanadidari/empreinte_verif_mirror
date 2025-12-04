✅ FICHIER 8/10 — DEPLOY_GUIDE.md (Version Militaire PRO)

👉 À coller tel quel dans :
/docs/DEPLOY_GUIDE.md

📄 DEPLOY_GUIDE.md — VERCEL DEPLOYMENT DOSSIER (VDD-1)
Projet : empreinte_verif — Classification : OPÉRATIONNEL / CRITIQUE / ZERO-ERROR
🟦 1. OBJECTIF

Ce guide fournit la procédure officielle, obligatoire et non modifiable pour déployer l’application Flutter Web du projet empreinte_verif.

Aucun autre mode de déploiement n'est autorisé.

🟥 2. PRÉREQUIS OBLIGATOIRES
2.1 — Flutter Web installé

L’environnement local doit valider :

flutter doctor
flutter config --enable-web

2.2 — Dépendances
flutter pub get

2.3 — Structure requise

pubspec.yaml

/lib

/web

vercel.json

.github/workflows/build_web.yml

2.4 — Secrets GitHub

Obligatoires :

VERCEL_TOKEN

2.5 — Domaine

Résolution DNS :

qrpruf.sanadidari.com → CNAME → vercel-dns-017.com


SSL doit être actif.

🟦 3. ÉTAPE 1 — BUILD FLUTTER WEB

Dans le repo privé :

flutter clean
flutter pub get
flutter build web --release


L’output doit être :

build/web/


🎯 Interdit : modifier manuellement build/web.

🟦 4. ÉTAPE 2 — IMPORT ET CONFIGURATION VERCEL
4.1 — Créer le projet

Via :

https://vercel.com/import


Choisir :

Import GitHub Repository

sélectionner sanadidari/empreinte_verif (repo privé)

4.2 — Configuration

Framework : Other
Build command :

flutter build web --release


Output :

build/web


Puis : Deploy.

🟥 5. ÉTAPE 3 — ROUTAGE FLUTTER WEB (SPA)

Le fichier vercel.json doit contenir :

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


🎯 Interdiction absolue : déployer sans SPA fallback.

🟦 6. ÉTAPE 4 — TESTS DU DÉPLOIEMENT

Une fois Vercel déployé :

Vérifier sur l’URL Preview :

chargement de main.dart.js

aucune erreur console

assets non manquants

rafraîchissement page fonctionne

index.html bien utilisé comme fallback

Vérifier sur le domaine final :
https://qrpruf.sanadidari.com
https://www.qrpruf.sanadidari.com

🔥 Tests obligatoires :

scanner interface visible

responsive correct

pas de 404 interne

SSL valide

🟥 7. ÉTAPE 5 — MISE À JOUR DOCUMENTATION

Après déploiement réussi, l’agent doit mettre à jour :

STATE_PROJECT.md

TASKS.md

HISTORY.md (optionnel mais recommandé)

avec :

date du déploiement

hash du commit déployé

URL preview

statut final

🟦 8. ÉTAPE 6 — TROUBLESHOOTING MILITAIRE
❌ Page blanche

Causes probables :

base-href incorrect

assets manquants

manque SPA fallback dans vercel.json

Fix :

flutter clean
flutter build web --release

❌ Vercel Error: Flutter not found

Cause :

Vercel ne télécharge pas Flutter automatiquement

Fix dans GitHub Actions :

uses: subosito/flutter-action@v2

❌ 404 sur navigation interne

Cause :

vercel.json manquant ou incorrect

Fix :
Ajouter fallback → /index.html

❌ Erreur DNS / SSL

Cause :

propagation lente HostPapa

CNAME mal défini

Fix :

vérifier dnschecker.org

attendre propagation

🟥 FIN DU FICHIER 8/10 — DEPLOY_GUIDE.md