# empreinte_verif — Military AI Control Framework + 5-Layer Employee Security System

This repository implements a dual-architecture:

1. **A military-grade AI governance system**  
   ensuring strict, deterministic, automated control over ChatGPT agents.

2. **A high-security employee access system**  
   based on **5 layers of authentication**, where biometrics represent only 1/5 of the full project vision.

This README summarizes the roles of each file and how the project must be operated.

---

# 🔵 PRIMARY PROJECT VISION (MUST READ FIRST)
Before interacting with the system, all agents and developers MUST read:

```
/docs/00_PROJECT_VISION.md
```

This file explains:
- The 5 layers of authentication  
- The long-term vision of the project  
- Why biometrics = only Layer 1  
- The security model and future development roadmap  

---

# 🔵 MILITARY AI CONTROL SYSTEM (EXECUTABLE)
The operational behavior of all AI agents is defined in:

```
01_BOOT_AND_RULES.md
02_SYSTEM_SCAN.md
03_MISSION_STATUS.md
```

These files:
- Control agent behavior  
- Enforce PRO-MODE  
- Define the automatic BOOT → MIRROR → SCAN → STATUS pipeline  
- Restrict modifications  
- Maintain mission integrity  
- Require deterministic, one-task-per-message execution  

Agents MUST execute these files automatically in the defined sequence.

---

# 🔵 DOCUMENTATION FILES (NOT EXECUTED)
Stored inside `/docs/`:

```
00_PROJECT_VISION.md       ← Read first (project purpose)
05_ROADMAP.md              ← Future phases & development plan
06_LAYER_STRUCTURE.md      ← Flutter architecture for 5 layers
```

These files:
- Provide project context  
- Provide internal structure  
- Provide long-term strategy  
They are *not* part of the execution pipeline.

---

# 🔵 REPOSITORY MIRROR
All agents MUST load the mirror:

```
https://github.com/sanadidari/empreinte_verif_mirror
```

---

# 🔵 HOW TO START A NEW AGENT
1. Send:
```
00_PROJECT_VISION.md
```

2. Then send the 4 military files:
```
01_BOOT_AND_RULES.md
02_SYSTEM_SCAN.md
03_MISSION_STATUS.md
```

3. The agent will automatically execute the full pipeline.

4. Validate the agent using:
```
/docs/AGENT_VERIFICATION_TEST.md
```

5. Only then continue development.

---

# END OF README.md
