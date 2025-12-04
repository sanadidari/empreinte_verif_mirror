# ARCHITECTURE.md — Version Vercel

## 1) Description
Flutter Web → Déploiement automatique via Vercel.

## 2) Pipeline attendu
- Build :
    flutter build web --release
- Output : build/web
- Framework : “Other”

## 3) Fonctionnement
À chaque push GitHub :
1. Vercel clone le repo
2. Installe Flutter
3. Build Web
4. Déploie automatiquement
5. Fournit URL publique + preview

## 4) Points importants
- HostPapa n’est plus utilisé pour déployer Flutter Web.
- Le site final est hébergé sur Vercel.
