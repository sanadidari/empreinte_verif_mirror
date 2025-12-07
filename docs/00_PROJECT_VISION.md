# 00_PROJECT_VISION.md — PROJECT SECURITY BLUEPRINT (v1.0)
Project: empreinte_verif  
Purpose: Provide the strategic vision and security architecture of the project  
before activating the automated military AI system.

This file is **NOT** part of the execution pipeline.  
Agents MUST read it to understand the project’s purpose  
but MUST NOT treat it as a system control file.

-------------------------------------------------------------
# 🔵 PROJECT OVERVIEW

**empreinte_verif** is a high-security employee access system designed to verify  
that the person attempting to access their workspace is the legitimate employee.

The system uses a **5-layer international authentication model**  
to eliminate identity fraud, device manipulation, and unauthorized access.

This is NOT a biometric demo.  
Biometrics represent only **1/5 of the total security architecture**.

Agents MUST understand this vision before interacting with the project.

-------------------------------------------------------------
# 🔵 THE 5 SECURITY LAYERS (FOUNDATION OF THE PROJECT)

## 1️⃣ BIOMETRIC AUTHENTICATION (Layer 1)
Goal: Verify that the employee is physically holding their device.  
Examples:  
- Fingerprint (Android BiometricPrompt)  
- FaceID (iOS)  
- Secure Enclave / Trusted Execution Environment  

This is only the **first validation step**.

---

## 2️⃣ FACIAL RECOGNITION (Layer 2)
Goal: Confirm that the person visually matches their registered identity.

Possible technologies:  
- ML Kit Face Recognition  
- TensorFlow Lite  
- FaceNet embeddings  

This ensures the fingerprint owner = the real person.

---

## 3️⃣ INTERNATIONAL CERTIFIED TIMING (Layer 3)
Goal: Guarantee the access time is legitimate and not manipulated.

The device time CANNOT be trusted.

System must use external NTP sources:  
- `time.google.com`  
- `pool.ntp.org`  
- `time.cloudflare.com`

This protects against time-forgery attacks and retroactive access fraud.

---

## 4️⃣ REAL-TIME LOCATION VERIFICATION (Layer 4)
Goal: Ensure the employee is physically in an allowed location.

Requirements:  
- GPS + Network triangulation  
- WiFi trust evaluation  
- Anti-fake-GPS detection  
- Anti-emulator detection  

This prevents employees from accessing the system from unauthorized areas.

---

## 5️⃣ BLOCKCHAIN VERIFICATION (Layer 5)
Goal: Produce an immutable, tamper-proof audit trail proving:

✔ Identity  
✔ Time  
✔ Location  
✔ Biometric + Face verification  
✔ Device authenticity  

This gives legal and technical proof of access.

Possible chains:  
- Polygon  
- Avalanche  
- Hyperledger Fabric  
- Ethereum L2  

-------------------------------------------------------------
# 🔵 FULL AUTHENTICATION SEQUENCE (SUMMARY)

To access their weekly assigned missions, an employee must pass:

1. Biometric verification  
2. Facial recognition  
3. International certified timing  
4. Real-time location validation  
5. Blockchain-sealed verification  

If ANY layer fails → access MUST be blocked.

-------------------------------------------------------------
# 🔵 PROJECT GOALS

- Guarantee the identity of each employee accessing the system  
- Prevent impersonation and identity fraud  
- Prevent time manipulation  
- Prevent GPS spoofing  
- Provide legal and auditable evidence (blockchain)  
- Secure access to sensitive employee workspace  
- Provide long-term, international-grade trust  

-------------------------------------------------------------
# 🔵 AGENT EXPECTATIONS

Before working on this project, agents MUST:

✔ Understand that biometrics ≠ the project  
✔ Understand the 5-layer architecture  
✔ Know that the current Flutter code implements **only Layer 1**  
✔ Prepare to build the remaining 4 layers step-by-step  
✔ Maintain PRO-MODE discipline at all times  
✔ Follow the system military pipeline after reading this file

-------------------------------------------------------------
# 🔵 TRANSITION TO SYSTEM FILES

After reading this file, agents MUST proceed to the operational pipeline:

```
01_BOOT_AND_RULES.md
    → 02_SYSTEM_SCAN.md
        → 03_MISSION_STATUS.md
            → Await user questions
```

This file provides **vision**, not rules.

-------------------------------------------------------------
END OF FILE
