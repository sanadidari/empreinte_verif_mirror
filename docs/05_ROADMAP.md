# 05_ROADMAP.md — Military Development Roadmap (v1.0)
Project: empreinte_verif  
Purpose: Define the long-term engineering plan in 5 phases.

This file is NOT part of the execution system.  
Agents MUST NOT load this file automatically.  
It defines the strategy for human developers and future missions.

-------------------------------------------------------------
# 🔵 ROADMAP SUMMARY (5-LAYER SECURITY SYSTEM)

The project follows a strict sequence of development:

## PHASE 1 — Layer 1: Biometrics (Current Layer)
- Implement fingerprint authentication  
- Implement FaceID (iOS optional)  
- Validate biometric availability  
- Add success/error UI  
- Add retry logic  
- Prepare integration for Layer 2  

## PHASE 2 — Layer 2: Facial Recognition
- Implement face detection  
- Build embedding generator  
- Compare embeddings with stored templates  
- Add anti-spoofing  
- Add face enrollment flow  

## PHASE 3 — Layer 3: International Certified Timing
- Query trusted NTP servers  
- Cross-check vs device time  
- Validate time deviation  
- Block access if manipulated  

## PHASE 4 — Layer 4: Real-Time Location Validation
- GPS + network + WiFi triangulation  
- Anti-fake-GPS checks  
- Anti-emulator detection  
- Approved zone verification  

## PHASE 5 — Layer 5: Blockchain Proof
- Create proof hashes (bio + face + time + location)  
- Send to blockchain network  
- Store immutable access record  

-------------------------------------------------------------
# 🔵 FUTURE OPTIONAL PHASES

## PHASE 6 — Admin Dashboard
- Employee access logs  
- Blockchain audit  
- Map view of access activity  

## PHASE 7 — Multi-User Expansion
- Multi-device  
- Team management  
- Weekly mission assignments  

-------------------------------------------------------------
# END OF FILE
