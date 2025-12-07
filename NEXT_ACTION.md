# NEXT_ACTION.md
# Military Protocol v3.0 — Instruction Set
# Projet : empreinte_verif

## 🎯 Objectif immédiat
Continuer la mise en conformité du projet Flutter pour garantir :
- stabilité,
- sécurité,
- maintenabilité,
- synchronisation Git,
- compatibilité multiplateforme.

## 📌 Actions prioritaires

1️⃣ **Créer une architecture propre dans lib/**  
   - Vérifier que le projet est bien organisé en :  
     lib/  
       └── core/  
       └── services/  
       └── views/  
       └── widgets/  

2️⃣ **Uniformiser les assets**  
   - Vérifier que toutes les images dans `assets/images/`  
     sont déclarées correctement dans `pubspec.yaml`.

3️⃣ **Renforcer CI/CD GitHub**  
   - Vérifier secrets :  
     - MIRROR_DEPLOY_KEY  
     - VERCEL_TOKEN  
   - S'assurer que le workflow `mirror.yml` fonctionne.

4️⃣ **Préparer intégration biométrique**  
   - Confirmer l’usage du plugin `local_auth`.  
   - Vérifier compatibilité Android SDK 33+ et iOS 15+.

5️⃣ **Créer un fichier de configuration globale**  
   - Ex : `/lib/config/app_config.dart`

6️⃣ **Maintenir le fichier `state_flutter.txt`**  
   - Mettre à jour après chaque session agent.

7️⃣ **Maintenir `state_flutter_sanad.md`**  
   - Journal militaire d’évolution du projet.

---

## 📌 Actions secondaires

- Optimiser code Flutter (lint, naming, folders).  
- Vérifier `pubspec.yaml` (dépendances propres).  
- Vérifier web deployment sur Vercel.  
- Vérifier configuration `android/app/build.gradle`.

---

## 📌 Prochaine opération militaire
Envoyer la commande :

