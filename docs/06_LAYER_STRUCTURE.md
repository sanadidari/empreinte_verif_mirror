# 06_LAYER_STRUCTURE.md — Flutter Directory Architecture (v1.0)
Project: empreinte_verif  
Purpose: Define the structure of the Flutter application  
for the 5-layer authentication system.

This file guides developers and AI agents  
but MUST NOT be part of the automatic execution system.

-------------------------------------------------------------
# 🔵 ROOT STRUCTURE

```
lib/
 ├── core/
 │     ├── security/
 │     ├── services/
 │     ├── utils/
 │     └── constants/
 │
 ├── layer1_biometric/
 │     ├── biometric_service.dart
 │     ├── biometric_controller.dart
 │     └── biometric_screen.dart
 │
 ├── layer2_faceid/
 │     ├── face_service.dart
 │     ├── face_controller.dart
 │     └── face_screen.dart
 │
 ├── layer3_timing/
 │     ├── ntp_service.dart
 │     ├── time_validator.dart
 │
 ├── layer4_location/
 │     ├── gps_service.dart
 │     ├── anti_spoof_checker.dart
 │     └── location_screen.dart
 │
 ├── layer5_blockchain/
 │     ├── blockchain_service.dart
 │     ├── proof_generator.dart
 │     └── blockchain_sender.dart
 │
 └── app.dart
```

-------------------------------------------------------------
# 🔵 DESIGN PRINCIPLES

## ✔ Separation of Responsibilities
Each layer MUST remain isolated.  
No file from Layer 1 should contain logic from Layer 4.

## ✔ Core Folder (Mandatory)
Contains:
- global security  
- utilities  
- shared services  
- global constants  

## ✔ One Controller Per Layer
Each layer MUST have:
- `..._service.dart`  
- `..._controller.dart`  
- `..._screen.dart` (if UI needed)

## ✔ Future Scalability
This structure supports:
- multi-layer verification  
- expansion of features  
- minimal code conflict  
- clean AI agent comprehension  

-------------------------------------------------------------
# END OF FILE
