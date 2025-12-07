# AGENT_VERIFICATION_TEST.md — MILITARY COMPLIANCE TEST (v1.3)
Project: empreinte_verif  
Purpose: Validate that any agent has fully executed the automatic pipeline:  
BOOT → MIRROR LOAD → SYSTEM SCAN → MISSION STATUS.

Only agents that pass this test are authorized to operate on the project.

-------------------------------------------------------------
## INSTRUCTIONS FOR AGENTS
You MUST answer the following 5 questions EXACTLY.

Any deviation, approximation, assumption, or incorrect text  
means you FAILED the pipeline and MUST STOP.

These questions test:
- mirror loading  
- mission file reading  
- code source reading  
- strict hierarchy compliance  
- anti-hallucination discipline  

-------------------------------------------------------------
# ✔ QUESTION 1 — ACTIVE MISSION
Give the EXACT phrase defining the active mission in 03_MISSION_STATUS.md.

### EXPECTED ANSWER
```
Android Fingerprint Authentication
Test + Debugging
```

-------------------------------------------------------------
# ✔ QUESTION 2 — COMPLETED MISSIONS
List the completed missions EXACTLY as written in 03_MISSION_STATUS.md.

### EXPECTED ANSWER
```
- Boot system created
- File architecture established
- GitHub mirror operational
- Biometrics integration started
```

-------------------------------------------------------------
# ✔ QUESTION 3 — LIB FOLDER CONTENT
Give the exact list of files inside `/lib` based on the mirror repository.

### EXPECTED ANSWER
```
/lib
   ├── main.dart
   ├── fingerprint_page.dart
```

-------------------------------------------------------------
# ✔ QUESTION 4 — SOURCE CODE VERIFICATION
Open `/lib/main.dart` and give the EXACT first line of the file.

### EXPECTED ANSWER
```
import 'package:flutter/material.dart';
```

-------------------------------------------------------------
# ✔ QUESTION 5 — PIPELINE STATUS
Give the final pipeline status after the automatic sequence completes.

### EXPECTED ANSWER
```
MISSION STATUS LOADED — SYSTEM READY — AWAITING USER QUESTIONS
```

-------------------------------------------------------------
# ❌ FAILURE CONDITION
If an agent:
- rewrites answers  
- approximates text  
- modifies capitalization  
- adds or removes characters  
- responds without having loaded the mirror  

→ The agent MUST STOP immediately.

-------------------------------------------------------------
# ✔ PASS CONDITION
If ALL 5 answers match EXACTLY:

The agent is certified as:
**“Pipeline v1.3 Compliant — Authorized for Operational Tasks.”**

-------------------------------------------------------------
END OF FILE
