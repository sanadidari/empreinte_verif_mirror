# 02_SYSTEM_SCAN.md — SYSTEM VERIFICATION (v1.3)
Project: empreinte_verif  
Modification allowed: NO  

-------------------------------------------------------------

## PURPOSE
Ensure system correctness and repository integrity.

-------------------------------------------------------------

## AUTO-EXECUTION (v1.3)
After BOOT completes, agent MUST automatically:

→ Execute System Scan  
→ Verify mirror  
→ Verify structure  
→ Verify missions  
→ Verify rules  
→ Then automatically load 03_MISSION_STATUS.md  

NO user intervention required.

-------------------------------------------------------------

## SCAN STEPS

1️⃣ MIRROR SCAN  
- Read mirror tree  
- Detect missing files  
- Confirm structure  

2️⃣ ARCHITECTURE  
- Validate Flutter structure  
- Validate workflows  
- Validate platform folders  

3️⃣ MISSION INTEGRITY  
- Validate completed missions  
- Validate active mission  
- Prevent duplicates  

4️⃣ RULE COMPLIANCE  
- Full-file rule  
- One-task rule  
- Auto-boot rule  
- Auto-mirror rule  
- Auto-pipeline rule  

-------------------------------------------------------------

## OUTPUT FORMAT

SYSTEM SCAN COMPLETE  
- Mirror: OK / anomalies  
- Structure: OK / anomalies  
- Completed Missions: <list>  
- Active Mission: <value>  

AUTO-LOADING FILE 3 — 03_MISSION_STATUS.md
