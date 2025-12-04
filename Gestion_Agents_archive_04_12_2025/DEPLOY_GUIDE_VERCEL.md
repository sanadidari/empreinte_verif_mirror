# Guide Déploiement — Vercel

## 🔷 Processus complet

### 1. Modifier ton code Flutter
Effectue tes changements dans `lib/` ou `web/`.

### 2. Préparer les fichiers pour GitHub
Avant de pousser :
```
git add .
git commit -m "update"
git push origin main
```

### 3. Vercel déploie automatiquement
À chaque push, Vercel reconstruit et redéploie.

### 4. Build Flutter interne
Commande utilisée :
```
flutter build web --release
```

### 5. Output final
- Dossier utilisé : `build/web`
