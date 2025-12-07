# LAYER 1 — BIOMETRIE (Fingerprint / FaceID)
Rôle : Vérifier que l’utilisateur est physiquement présent et que le téléphone
appartient bien à l’employé.

-------------------------------------------------------------
# 🔵 OBJECTIF
- Vérifier l'identité *physique* de l'utilisateur via fingerprint / FaceID.
- Empêcher la connexion par mot de passe volé.
- Préparer la transition vers la reconnaissance faciale.

C’est la barrière de sécurité la PLUS BRUTE :  
→ sans biométrie validée, on bloque.

-------------------------------------------------------------
# 🎯 FRONTEND (Flutter)
## A. Écran biométrique dédié
- Bouton “Vérifier mon empreinte”
- Détection automatique biométrie disponible / non disponible
- Design simple + clair

## B. Intégration Flutter
Utilisation du plugin :
```
local_auth
```

Fonctions à implémenter :
- `isDeviceSupported()`  
- `getAvailableBiometrics()`  
- `authenticate()`

## C. Gestion des erreurs
- empreinte non reconnue  
- capteur sale  
- annulation utilisateur  
- capteur indisponible  

Affichage obligatoire :
- message d'erreur  
- bouton "réessayer"  

-------------------------------------------------------------
# 🔵 BACKEND
## A. Le backend reçoit :
- deviceID  
- employeeID  
- timestamp  
- résultat biométrie (true/false)

## B. Le backend valide :
- device autorisé ?  
- employé actif ?  
- biométrie validée ?  

Pas de password ici.

## C. Le backend génère un “biometric token” temporaire :
Exemple :
```
bio_token = SHA256(employeeID + deviceID + timestamp)
```

Ce token est utilisé en entrée du Layer 2 (Reconnaissance faciale).

-------------------------------------------------------------
# 🚧 POINTS TECHNIQUES CRITIQUES
- Certains téléphones ne supportent pas la biométrie  
- Android et iOS ont des APIs différentes  
- flutter/local_auth n’est pas toujours stable  
- Nécessité de tester sur appareil réel  

-------------------------------------------------------------
# 🟢 JEUX DE DONNÉES
- employeeID
- deviceID
- biometric_success
- timestamp

-------------------------------------------------------------
# 🔐 RISQUE SI MAL IMPLEMENTÉ
- Spoof de device  
- Possibilité d’emprunter un téléphone déverrouillé  
- Attaques par replay

-------------------------------------------------------------
# ✔ STATUT
→ Base du système  
→ Ce que tu testes maintenant  
→ Indispensable pour la suite
