# TASKS.md — Mission Tasks / Opérations Immediates  
Version : 3.0  
Mise à jour : 06/12/2025 — 20:55  

============================================================  
📌 1. PRIORITÉ ABSOLUE (P1)  
============================================================  

### 🔥 Tâche P1.1 — Intégrer la vue biométrique dans le flux
- Ajouter un bouton "Tester biométrie" dans l’écran Login  
- Rediriger vers `BiometricTestView`  
- Après validation fingerprint → revenir à Login et afficher succès  

### 🔥 Tâche P1.2 — Définir l’icône officielle de l’application  
- Fournir un logo PNG 1024x1024  
- Configurer `flutter_launcher_icons`  
- Générer icônes Android & Web  

### 🔥 Tâche P1.3 — Choisir la technologie backend  
Option A : Backend PHP + MySQL (hébergement actuel)  
Option B : Firebase Auth + Firestore  
Option C : Node.js Express + MongoDB  

Décision requise avant de continuer l'app.  

============================================================  
📌 2. PRIORITÉ HAUTE (P2)  
============================================================  

### Tâche P2.1 — Créer écran UX final biométrie  
- Interface simple : icône ✦ animation ✦ message  
- Mode sombre respecté  
- Prévoir retour d’erreur  

### Tâche P2.2 — Préparer structure API Service  
Dans `lib/services/` :  
- api_auth_service.dart  
- api_user_service.dart  

============================================================  
📌 3. PRIORITÉ MOYENNE (P3)  
============================================================  

### Tâche P3.1 — Améliorer architecture login  
- Ajouter validation email / password  
- Préparer intégration backend (mock → réel)  

### Tâche P3.2 — Préparer routage PRO  
- Passer à `GoRouter` (optionnel)  

============================================================  
📌 4. PRIORITÉ FAIBLE (P4)  
============================================================  

### Tâche P4.1 — Nettoyage & optimisation  
- Supprimer imports inutilisés  
- Normaliser commentaires PRO MODE  
- Vérifier cohérence fichiers services  

============================================================  
📌 5. ÉTAT DES TÂCHES  
============================================================  

| Tâche | Status |
|-------|--------|
| Build Android Release | ✔ Terminé |
| Test biométrique sur device | ✔ Terminé |
| Terminal VS Code opérationnel | ✔ Terminé |
| Upload FTP APK | ✔ Terminé |
| UI biométrique final | ⏳ En attente |
| Backend | ⏳ Décision requise |
| Icone appli | ⏳ En attente |

# TASKS.md — Mission Taskboard v13

## ✔ TERMINÉ
- Mise en place miroir GitHub
- Migration Vercel
- Documentation militaire unifiée
- TITAN / OMEGA / MATRIX initialisés

## 🟥 PHASE ACTIVE — BIOMÉTRIE (v13)
1. Tester fingerprint Android localement  
2. Valider installation APK  
3. Capturer erreurs runtime  
4. Stabiliser service biométrique  
5. Intégrer la page de test dans HomeView  
6. Vérifier permissions Android  
7. Préparer migration vers LOGIN_VIEW

## 🟦 PHASE SUIVANTE — RECONNAISSANCE FACIALE (v14)
(en attente)

## 🟧 FUTUR — LOCALISATION + TIMING (v15)
(en attente)

## 🟩 FINAL — BLOCKCHAIN (v16)
(en attente)

============================================================  
📌 6. FIN DU DOCUMENT  
============================================================  
Toute action doit être alignée avec :  
- NEW_AGENT_ONBOARDING.md  
- STATE_PROJECT.md  
- NEXT_ACTION.md  
