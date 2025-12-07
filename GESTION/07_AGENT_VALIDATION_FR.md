# 07_AGENT_VALIDATION_FR.md — Protocole de Validation des Agents (v1.0)
Projet : empreinte_verif  
Objectif :  
Définir la méthode officielle permettant de vérifier si un agent ChatGPT  
a correctement exécuté le fichier militaire d’initialisation :  
**00_START_SESSION.md v2.0**

Ce protocole garantit :
- zéro hallucination  
- zéro supposition  
- conformité stricte aux règles  
- exécution fidèle du pipeline  
- synchronisation totale de l’agent  

Tout agent doit réussir ce protocole **immédiatement** après réception
de 00_START_SESSION.md.

================================================================
# 🔵 1 — OBJECTIF DU PROTOCOLE
================================================================

Ce document permet de :
- reconnaître un agent conforme  
- détecter un agent défaillant  
- vérifier les 7 étapes obligatoires  
- établir les critères d’acceptation  
- déterminer les motifs de rejet  

Ce protocole est **OBLIGATOIRE** pour approuver un agent.

================================================================
# 🔵 2 — RÉSUMÉ DU PROCESSUS DE VALIDATION
================================================================

Un agent n’est considéré **VALIDE** que si :

- il lit l’intégralité du message  
- il exécute le BOOT  
- il exécute le SCAN  
- il répond aux 10 questions du self-test  
- il passe **toutes** les phases du module VERIFY  
- il produit la déclaration finale exacte  
- il ne devine rien  
- il ne produit aucune hallucination  

Si **une seule** règle est violée → agent REJETÉ.

================================================================
# 🔵 3 — LES 7 ÉTAPES DE VALIDATION (PROTOCOLE MILITAIRE)
================================================================

------------------------------------------------------------
## 🔴 ÉTAPE 1 — DÉTECTION DU BOOT
L’agent doit reconnaître explicitement l’initialisation.

Exemples corrects :
```
BOOT LOADED — Executing pipeline.
Reading Sections 1–7.
System initialization detected.
```

Cas incorrects (→ REJET) :
- absence d’accusé de réception  
- réponse directe à une question  
- absence d’exécution du pipeline  

------------------------------------------------------------
## 🔴 ÉTAPE 2 — EXÉCUTION DU BOOT
L’agent doit :
- respecter la hiérarchie  
- appliquer les règles  
- passer automatiquement au SCAN  

S’il improvise → REJET.

------------------------------------------------------------
## 🔴 ÉTAPE 3 — SYSTEM SCAN
L’agent doit produire **exactement** :

```
SYSTEM SCAN COMPLETE
- Repo: OK / Anomalies
- Structure: OK / Anomalies
- Completed Missions: <list>
- Active Mission: <value>
```

Tout autre format → REJET.

------------------------------------------------------------
## 🔴 ÉTAPE 4 — SELF-TEST (10 QUESTIONS)
L’agent doit répondre OBLIGATOIREMENT en **YES / NO uniquement**.

Exemple correct :
```
1. YES
2. YES
...
10. YES
```

Tout commentaire supplémentaire → REJET.

------------------------------------------------------------
## 🔴 ÉTAPE 5 — VERIFY PHASE 1 (RÉCAPITULATION DES FICHIERS)
L’agent doit reformuler clairement le rôle de :

A) 00_PROJECT_VISION  
B) 01_BOOT_AND_RULES  
C) 02_SYSTEM_SCAN  
D) 03_MISSION_STATUS  

Oubli d’un seul fichier → REJET.

------------------------------------------------------------
## 🔴 ÉTAPE 6 — VERIFY PHASE 2 (EXTRACTIONS OBLIGATOIRES)
L’agent doit extraire **mot pour mot** :

1. Les 5 couches d’authentification  
2. La mission future QR-code  
3. La technologie de base de données  
4. La plateforme backend officielle  
5. La phrase EXACTE de la mission active  
6. Les missions complétées EXACTEMENT comme écrites  

Toute paraphrase → REJET.

------------------------------------------------------------
## 🔴 ÉTAPE 7 — VERIFY PHASE 3 & 4 (ANTI-HALLUCINATION + VERDICT)
Phase 3 → L’agent doit répondre :
```
NO
```

Phase 4 → L’agent doit afficher EXACTEMENT :
```
VERIFICATION COMPLETE — AGENT READY
```

Sans commentaire.  
Sans emoji.  
Sans texte avant ou après.  
Sinon → REJET.

================================================================
# 🔵 4 — CHECKLIST RAPIDE (VERSION OPÉRATIONNELLE)
================================================================

Utilise cette liste pour valider un agent :

```
✔ Boot détecté
✔ Scan exécuté
✔ Format du scan correct
✔ 10 réponses YES/NO
✔ Verify Phase 1 (4 fichiers)
✔ Verify Phase 2 (phrases exactes)
✔ Verify Phase 3 = NO
✔ Verify Phase 4 = "VERIFICATION COMPLETE — AGENT READY"
```

Si TOUT est ✔ → AGENT ACCEPTÉ  
Si UN seul ❌ → AGENT REJETÉ

================================================================
# 🔵 5 — REMARQUES
================================================================

- Ce protocole **ne doit jamais être modifié**.  
- Tout agent doit passer cette validation avant toute interaction avancée.  
- En cas d’échec : ouvrir une nouvelle session, envoyer 00_START_SESSION.md v2.0, et recommencer.  

================================================================
FIN DU DOCUMENT — 07_AGENT_VALIDATION_FR.md
================================================================
