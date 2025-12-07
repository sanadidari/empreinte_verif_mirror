# LAYER 4 — LOCALISATION RÉELLE + ANTI-SPOOF
Rôle : Vérifier que l’employé est physiquement
dans une zone autorisée lors de la connexion.

-------------------------------------------------------------
# 🔵 OBJECTIF
Empêcher les utilisateurs d'accéder :
- depuis une autre ville  
- depuis un faux GPS  
- depuis un émulateur  
- depuis un VPN  
- depuis un appareil falsifié  

-------------------------------------------------------------
# 🎯 FRONTEND (Flutter)
## A. Permissions :
- LOCATION_WHEN_IN_USE
- vérification GPS ON
- vérification pas de mock location

## B. Anti-Spoof Flutter :
- détection mock GPS provider  
- détection mode développeur  
- détection emulator  
- détection root  

## C. UI :
- carte (si besoin)
- message erreurs (GPS OFF, spoof détecté, etc.)

-------------------------------------------------------------
# 🔵 BACKEND
## A. Le backend reçoit :
- lat/long  
- altitude  
- accuracy  
- mock_flag  
- device integrity flags  

## B. Le backend valide :
- zones autorisées  
- géorepérage  
- cohérence altitude/latitude  
- absence de VPN dangereux  
- absence d’émulateur  

## C. Réponse backend :
```
{
  "location_valid": true/false,
  "anti_spoof": true/false,
  "allowed_zone": "Casablanca HQ"
}
```

-------------------------------------------------------------
# 🚧 POINTS TECHNIQUES
- GPS imprécis en intérieur  
- utilisateurs malicieux  
- emulateur très dur à détecter  
- hacking avancé (mock location frameworks)  

-------------------------------------------------------------
# 🔐 RISQUE
- accès depuis l’étranger  
- fraude au pointage  
- accès à distance par usurpation  

-------------------------------------------------------------
# ✔ STATUT
→ 4e barrière  
→ Devient très solide combiné au Layer 3
