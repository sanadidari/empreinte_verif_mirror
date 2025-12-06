# NEXT_ACTION.md — Directive opérationnelle immédiate  
Version : 3.0  
Mise à jour : 06/12/2025 — 20:55  

============================================================  
🎯 OBJECTIF IMMÉDIAT  
============================================================  
**Préparer l’intégration finale de la biométrie dans le flux de connexion.**

L'app fonctionne, la biométrie fonctionne, le build fonctionne.  
Maintenant on doit **l’intégrer proprement dans l’expérience utilisateur**.

============================================================  
🟦 ACTION 1 — Créer un bouton "Tester biométrie" sur login  
============================================================  
- Ajouter un bouton sur `login_view.dart`  
- Route vers `BiometricTestView`  
- Fonction :  
  → Si biométrie validée : `Navigator.pop(context, true)`  
  → Le Login affichera : "Validation biométrique réussie"

============================================================  
🟩 ACTION 2 — Préparer l’icône officielle  
============================================================  
- Attendre logo PNG 1024x1024  
- Configurer `flutter_launcher_icons`  
- Regénérer icônes :  
```
flutter pub run flutter_launcher_icons
```

============================================================  
🟧 ACTION 3 — Décision sur backend  
============================================================  
Avant d'aller plus loin, un backend DOIT être choisi.  

⮞ Le prochain agent doit lire `TASKS.md` → section P1.3.


# NEXT_ACTION.md — PROTOCOL TASK ORDER (PTO-2)
Niveau : TOP PRIORITY  
Phase active : BIOMÉTRIE

Mission unique autorisée :

🟥 **Tester et valider la biométrie Android (empreinte digitale).**

Étapes obligatoires :
1. Vérifier que l’APK s’installe et s’ouvre  
2. Tester l’authentification fingerprint  
3. Identifier erreurs runtime  
4. Remonter logs dans SUPERVISOR_REPORT.md  
5. Stabiliser la logique biométrique  
6. Préparer LoginView (phase 2)

Aucune autre action n’est autorisée.

============================================================  
🟥 ACTION FUTURE (non immédiate)  
============================================================  
- Migrer login mock → backend réel  
- Créer API Service  
- Activer authentification réelle  

============================================================  
⚠️ NOTE PRO MODE  
============================================================  
Tout agent doit :  
- Ne toucher AUCUNE zone interdite (lib/, android/)  
- Travailler fichiers complets  
- Documenter actions dans STATE_PROJECT.md  

============================================================  
FIN DE LA DIRECTIVE  
