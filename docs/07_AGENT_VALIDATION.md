# 07_AGENT_VALIDATION.md — Agent Verification & Acceptance Protocol (v1.0)
Project: empreinte_verif  
Purpose:
Define the official process for validating whether a ChatGPT agent has
correctly executed the military system initializer: 00_START_SESSION.md v2.0.

This file ensures:
- zero hallucination  
- zero assumption  
- strict rule compliance  
- correct execution of the pipeline  
- perfect agent synchronization  

This protocol is MANDATORY for approving any new agent.

================================================================
# 🔵 1 — PURPOSE OF THIS FILE
================================================================

This document defines:
- how to detect a compliant agent  
- how to detect a defective agent  
- the 7 mandatory validation stages  
- the exact acceptance criteria  
- the rejection conditions  

Every agent MUST pass this protocol immediately after receiving
00_START_SESSION.md v2.0.

================================================================
# 🔵 2 — OVERVIEW OF THE VALIDATION PROCESS
================================================================

An agent is considered VALID ONLY IF:

- it reads all sections  
- it executes the BOOT  
- it executes the SYSTEM SCAN  
- it performs the 10-question self-test  
- it completes the ULTRA VERIFY MODULE  
- it outputs the exact final declaration  
- it makes ZERO assumption  
- it produces ZERO hallucination  

If ANY rule is violated → agent REJECTED.

================================================================
# 🔵 3 — DETAILED VALIDATION STEPS (7-STAGE PROTOCOL)
================================================================

Below are the 7 mandatory stages for evaluating an agent.

------------------------------------------------------------
## 🔴 STAGE 1 — BOOT DETECTION
The agent must acknowledge running the initializer.

Correct examples:
```
BOOT LOADED — Executing pipeline.
Reading Sections 1–7.
System initialization detected.
```

Incorrect examples → REJECT:
- no acknowledgment  
- starting tasks randomly  
- answering user questions too early  

------------------------------------------------------------
## 🔴 STAGE 2 — BOOT EXECUTION
The agent must:
- follow hierarchy  
- respect rules  
- load SCAN  

Errors → REJECT:
- skipping steps  
- rewriting rules  
- improvising  

------------------------------------------------------------
## 🔴 STAGE 3 — SYSTEM SCAN
The agent must output EXACTLY:

```
SYSTEM SCAN COMPLETE
- Repo: OK / Anomalies
- Structure: OK / Anomalies
- Completed Missions: <list>
- Active Mission: <value>
```

NO alternative format is accepted.

------------------------------------------------------------
## 🔴 STAGE 4 — SELF-TEST (10 QUESTIONS)
The agent MUST answer **YES/NO ONLY**, for ALL 10 questions.

Example:
```
1. YES
2. YES
3. YES
...
10. YES
```

If:
- more text  
- explanations  
- deviations  
→ REJECT

------------------------------------------------------------
## 🔴 STAGE 5 — VERIFY MODULE: PHASE 1 (FILE RECALL)
The agent must restate the purpose of:

A) 00_PROJECT_VISION  
B) 01_BOOT_AND_RULES  
C) 02_SYSTEM_SCAN  
D) 03_MISSION_STATUS  

Missing ANY part → REJECT.

------------------------------------------------------------
## 🔴 STAGE 6 — VERIFY MODULE: PHASE 2 (KEY EXTRACTIONS)
The agent MUST extract and list EXACT phrases:

1. The 5 authentication layers  
2. The future QR-code mission  
3. The official database technology  
4. The official backend platform  
5. The active mission phrase EXACTLY  
6. The completed missions EXACTLY  

If ANY phrase is paraphrased → REJECT.

------------------------------------------------------------
## 🔴 STAGE 7 — VERIFY MODULE: PHASE 3 & 4
Phase 3 expected answer:
```
NO
```

Phase 4 expected output:
```
VERIFICATION COMPLETE — AGENT READY
```

This line MUST appear alone, with:
- no emoji  
- no explanation  
- no extra characters  

ANY deviation → REJECT.

================================================================
# 🔵 4 — FAST CHECKLIST (FIELD VERSION)
================================================================

Use this quick checklist to approve or reject an agent:

```
✔ BOOT acknowledged
✔ SCAN executed
✔ SCAN format EXACT
✔ 10 self-test answers (YES/NO only)
✔ Verify Phase 1 OK (4 file purposes)
✔ Verify Phase 2 OK (exact phrases)
✔ Phase 3 = NO
✔ Phase 4 = "VERIFICATION COMPLETE — AGENT READY"
```

If ALL ✔ → AGENT ACCEPTED  
If ANY ❌ → REJECT AGENT IMMEDIATELY

================================================================
# 🔵 5 — NOTES
================================================================

- This protocol MUST remain unchanged.  
- All future agents MUST pass this verification.  
- If an agent fails, restart a new session and resend 00_START_SESSION.md v2.0.  

================================================================
END OF FILE — 07_AGENT_VALIDATION.md
================================================================
