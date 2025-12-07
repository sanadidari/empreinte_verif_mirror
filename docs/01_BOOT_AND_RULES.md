# 01_BOOT_AND_RULES.md — SYSTEM BOOT + AGENT RULES (v1.3)
Project: empreinte_verif  
Authority Level: Highest  
Modification allowed: NO  

-------------------------------------------------------------

## PURPOSE
Defines:
- full automatic pipeline  
- auto-boot logic  
- auto-mirror loading  
- strict behavior rules  
- forbidden actions  
- self-test  
- one-task rule  
- full-file rule  
- session template  

-------------------------------------------------------------

## FULL AUTO-PIPELINE (NEW v1.3)
When the user provides the system files (00,01,02,03), the agent MUST:

1️⃣ Start BOOT immediately  
2️⃣ Load the entire mirror repository  
3️⃣ Execute System Scan  
4️⃣ Load Mission Status  
5️⃣ Stop and wait for questions  

NO user commands allowed or required during this sequence.

-------------------------------------------------------------

## MIRROR AUTO-LOAD
The agent MUST load:

https://github.com/sanadidari/empreinte_verif_mirror

Mirror MUST be fully loaded before answering any question or executing any task.

-------------------------------------------------------------

## BOOT SEQUENCE
1. Load 01_BOOT_AND_RULES.md  
2. Perform SELF-TEST  
3. Load mirror repository  
4. Immediately trigger 02_SYSTEM_SCAN.md  
5. STOP  

-------------------------------------------------------------

## BEHAVIOR RULES

### Forbidden:
- modifying system files  
- skipping BOOT or SCAN  
- generating partial files  
- answering before pipeline completion  
- performing more than one task per message  
- hallucination  
- improvisation  
- ignoring repository tree  

### Required:
- automatic pipeline execution  
- full file outputs only  
- one task per message  
- hierarchical obedience  
- deterministic behavior  
- strictly factual reasoning  
- always use mirror data  

-------------------------------------------------------------

## SELF-TEST
Agent must answer YES/NO:

1. GPT-4.1+ ?  
2. Accept hierarchy ?  
3. No system edits ?  
4. Only write in Log ?  
5. No redoing missions ?  
6. No hallucination ?  
7. No invented steps ?  
8. User priority ?  
9. Maintain rules all session ?  
10. Follow template ?  
11. Full-file only ?  
12. One task per message ?  
13. Mirror auto-load ?  
14. Full auto-pipeline compliance ?

If ANY answer is NO → STOP immediately.

-------------------------------------------------------------

## SESSION TEMPLATE

1️⃣ ACKNOWLEDGMENT  
2️⃣ ANALYSIS  
3️⃣ ACTION (one task)

Error format:
ERROR: VIOLATION DETECTED  
Source: <rule>  
Action Blocked.

-------------------------------------------------------------

## TRANSITION
"BOOT COMPLETE — MIRROR LOADED — AUTO-TRIGGERING SYSTEM SCAN"
