# LAYER 5 — BLOCKCHAIN PROOF (Audit immuable)
Rôle : Générer une PREUVE IMPOSSIBLE À FALSIFIER
que l’employé a passé les 4 couches précédentes.

-------------------------------------------------------------
# 🔵 OBJECTIF
Chaque accès doit créer une "preuve" immuable contenant :

- identité confirmée  
- biométrie validée  
- visage validé  
- heure certifiée  
- position géographique réelle  
- device authentique  

Cette preuve doit être non-modifiable à vie.

-------------------------------------------------------------
# 🎯 FRONTEND (Flutter)
- affiche un badge “Vérification Finalisée”
- montre un hash blockchain
- permet de consulter l’audit des sessions

Flutter n’interagit PAS directement avec la blockchain.

-------------------------------------------------------------
# 🔵 BACKEND
## A. Le backend construit un objet JSON :
```
{
  employeeID: "X",
  timestamp_server: 1712323,
  location: {...},
  biometric_success: true,
  face_valid: true,
  anti_spoof: true
}
```

## B. Le backend génère un hash :
```
proof_hash = SHA256(json)
```

## C. Envoie sur une blockchain :
- Polygon  
- Avalanche  
- Ethereum L2  
- Hyperledger (privée)

## D. Retourne :
```
{
  "success": true,
  "tx_hash": "0x4f2d..."
}
```

-------------------------------------------------------------
# 🚧 POINTS TECHNIQUES
- frais réseau  
- latence blockchain  
- nécessité de clé privée sécurisée  
- backend doit être durci  

-------------------------------------------------------------
# 🔐 RISQUES SI MAL IMPLEMENTÉ
- preuve falsifiable  
- perte de confiance  
- blockchain centrale inaccessible  

-------------------------------------------------------------
# ✔ STATUT
→ Étape finale  
→ Donne un audit légal  
→ Rend ton système incassable  
