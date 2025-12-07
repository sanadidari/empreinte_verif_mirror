# LAYER 3 — TIMING INTERNATIONAL CERTIFIÉ (NTP)
Rôle : Empêcher les utilisateurs de modifier l'heure du téléphone
pour tromper le système.

-------------------------------------------------------------
# 🔵 OBJECTIF
Assurer que l'heure utilisée est :
- vraie  
- certifiée  
- internationale  
- NON manipulée par l'utilisateur  

Exemple de fraude :
→ l’employé modifie l’heure pour simuler une présence.

-------------------------------------------------------------
# 🎯 FRONTEND (Flutter)
- App n’utilise PAS l’heure du téléphone
- App appelle une API NTP
- Affiche un loader pendant la synchronisation

Bibliothèque Flutter :
```
ntp
```

-------------------------------------------------------------
# 🔵 BACKEND
## A. Sources NTP :
- time.google.com  
- pool.ntp.org  
- time.cloudflare.com  

## B. Backend compare :
```
server_time - device_time
```

Si différence > limite (ex + / - 30 sec)  
→ ÉCHEC  

## C. Backend enregistre :
```
timestamp_server
timestamp_device
deviation_ms
```

-------------------------------------------------------------
# 🚧 POINTS TECHNIQUES
- connexions réseau instables  
- VPN / proxy modifient la latence  
- téléphone en mode avion  
- NTP parfois bloqué dans certains pays  

-------------------------------------------------------------
# 🔐 RISQUE SI MAL IMPLEMENTÉ
- possibilité de contourner le système
- manipulation de présence / pointage

-------------------------------------------------------------
# ✔ STATUT
→ 3e barrière  
→ Donne une preuve temporelle solide  
→ Prérequis pour blockchain
