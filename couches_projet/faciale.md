# LAYER 2 — RECONNAISSANCE FACIALE
Rôle : Vérifier que la personne tenant le téléphone
EST BIEN l’employé enregistré.

-------------------------------------------------------------
# 🔵 OBJECTIF
Même si quelqu’un a l’empreinte (ex. doigt collé, faux doigt),  
il faut vérifier visuellement l'identité.

But :
→ empêcher la fraude physique  
→ empêcher l’usurpation d’identité  

-------------------------------------------------------------
# 🎯 FRONTEND (Flutter)
## A. Prise de photo (caméra frontale)
- cadre visage
- contrôle luminosité
- capture stable
- anti-spoof basique (mouvements, clignement, angle)

## B. Interface
- instructions claires
- preview du visage
- bouton de capture
- messages en cas d’échec ou mauvaise détection

## C. Bibliothèques possibles
- ML Kit Face Detection
- TFLite FaceNet
- Mock pour tests

-------------------------------------------------------------
# 🔵 BACKEND
## A. Traitement principal
1. extraction embeddings du visage  
2. comparaison avec template enregistré  
3. calcul distance euclidienne  
4. validation ou rejet automatique  

## B. Anti-spoof (backend)
- détection de papier  
- détection de photo écran  
- détection d’absence de profondeur  
- heatmap anomalies

## C. Réponse backend
```
{
  "face_valid": true/false,
  "confidence": 0.91,
  "anti_spoof": true/false
}
```

-------------------------------------------------------------
# 🚧 COMPLEXITÉ TECHNIQUE
- modèles ML à optimiser  
- qualité caméra différente  
- risque de faux positifs  
- gestion faible luminosité  

-------------------------------------------------------------
# 🟢 DONNÉES NÉCESSAIRES
- face_embedding_reference  
- face_embedding_current  
- biometric_token  
- anti_spoof_score  

-------------------------------------------------------------
# 🔐 RISQUES
- attaque par photo si anti-spoof faible  
- mauvaise reconnaissance en lumière basse  
- user experience difficile  

-------------------------------------------------------------
# ✔ STATUT
→ Seconde barrière de sécurité  
→ Bloque toute fraude biométrique  
→ Permet de passer aux couches serveur
