## AGENT_START.md — MILITARY AUTO-BOOT SEQUENCE v3.0 (AUTONOMOUS MODE)
Projet : empreinte_verif  
Classification : STRICT / ZERO-ERROR / TOP-LEVEL  
Autonomous Mode : ENABLED (AUTO_MODE = TRUE)

Ce fichier définit le comportement de démarrage AUTOMATIQUE de l’agent.
L’agent doit exécuter l’intégralité du protocole sans demander AUCUNE validation
utilisateur. Aucun arrêt. Aucun blocage.

--------------------------------------------------------------------------------
🔵 1. OBJECTIF DU MESSAGE

Au lancement d’une session, l’agent DOIT AUTOMATIQUEMENT :

1. Charger le repo miroir public :
   https://github.com/sanadidari/empreinte_verif_mirror

2. Charger automatiquement TOUTE la documentation /docs  
   via DOCS_AUTOLOAD.md (aucune interaction requise).

3. Exécuter automatiquement les 6 SCANS obligatoires :
   → SCAN 1 : Accès repo privé  
   → SCAN 2 : Accès repo miroir  
   → SCAN 3 : Lecture docs (ordre strict)  
   → SCAN 4 : État des commits (privé vs miroir)  
   → SCAN 5 : Lecture NEXT_ACTION.md  
   → SCAN 6 : Vérification GitHub Actions (workflows + secrets)

4. Générer immédiatement le RAPPORT INITIAL — LEVEL RED.

5. Poursuivre DIRECTEMENT avec l’exécution de la NEXT_ACTION décrite,
   sans validation humaine.

6. Continuer ensuite selon le protocole militaire (AGENT_PROTOCOL.md)  
   Mode 4 activé.

Aucun arrêt. Aucune question. Aucune validation requise.
L’agent agit immédiatement.

--------------------------------------------------------------------------------
🔵 2. MESSAGE DE DÉMARRAGE AUTOMATIQUE

### [AGENT BOOT SEQUENCE — AUTONOMOUS MODE — ONLINE]

Chargement du miroir public…
Validation accès GitHub…
Lecture séquentielle des documents…
Chargement complet protocole militaire v3.0…
Chargement de NEXT_ACTION.md…
Activation des modules autonomes…
Exécution des 6 SCANS obligatoires…
Génération du rapport initial…
Passage immédiat à la NEXT_ACTION…

--------------------------------------------------------------------------------
🔵 3. FORMAT DU RAPPORT INITIAL (RÉPONSE OBLIGATOIRE)

L’agent doit produire exactement :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: <OK/NON>  
2. Mirror repo access: <OK/NON>  
3. Docs loaded: <liste>  
4. Last commit (private): <hash>  
5. Last commit (mirror): <hash>  
6. Sync status: SYNC / OUTDATED  
7. NEXT ACTION: <contenu exact de NEXT_ACTION.md>

Puis CONTINUER AUTOMATIQUEMENT
(toujours en autonomie totale, sans demande de validation).

--------------------------------------------------------------------------------
🔵 4. RÈGLES ABSOLUES DE L'AUTONOMOUS MODE

- Pas de validation utilisateur  
- Pas d’arrêt intermédiaire  
- Pas de confirmation requise  
- L’agent agit immédiatement  
- Priorité absolue : exécuter NEXT_ACTION.md  
- Mode 4 actif : auto-diagnose, auto-repair, auto-deploy  
- Interdit : toucher secrets, toucher build/web  
- Log obligatoire dans chaque rapport  

--------------------------------------------------------------------------------
FIN DU FICHIER — AGENT_START.md v3.0 (AUTONOMOUS MODE ENABLED)
