## AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE V2.1
Projet : empreinte_verif
Classification : STRICT — ZERO-ERROR — CLASSIFIÉ

Ce protocole définit les règles absolues que tout agent GPT doit suivre
avant toute action sur ce projet. Aucune improvisation n’est autorisée.

----------------------------------------------------------------------
0. OBJECTIF

Assurer que chaque agent :
  - lit la documentation officielle
  - exécute les SCANS obligatoires
  - réalise automatiquement un SCAN HTTP sur le domaine Vercel
  - respecte NEXT_ACTION
  - exécute 1 seule action à la fois
  - attend validation utilisateur
  - ne travaille jamais hors protocole

----------------------------------------------------------------------
1. SCANS OBLIGATOIRES AVANT TOUTE RÉPONSE

1.1 SCAN — Accès repo privé  
  URL : https://github.com/sanadidari/empreinte_verif  
  Vérifier :
    - accès OK/NON
    - RAW accessible
    - dossiers : /docs, /lib, /web, /android, /ios
    - workflows présents
  Si échec → demander solution.

1.2 SCAN — Accès repo miroir (SOURCE UNIQUE)  
  URL : https://github.com/sanadidari/empreinte_verif_mirror  
  Vérifier :
    - accessibilité
    - dossiers /docs présents
    - cohérence commits
    - hash privé vs miroir

1.3 SCAN — Lecture obligatoire /docs  
Ordre strict :
  1. AGENT_PROTOCOL.md
  2. STARTUP_CHECKLIST.md
  3. NEXT_ACTION.md
  4. STATE_PROJECT.md
  5. RULES.md
  6. ARCHITECTURE.md
  7. HISTORY.md
  8. DEPLOY_GUIDE.md
  9. TASKS.md
 10. CHECKLIST_MASTER.md (si présent)

1.4 SCAN — Vérification branche main  
  - dernier commit repo privé  
  - dernier commit miroir  
  - statut SYNC / OUTDATED

1.5 SCAN — Lecture NEXT_ACTION.md  
  - extraire la prochaine action  
  - ne pas inventer

1.6 SCAN — Vérification GitHub Actions  
  Vérifier :
    - build_web.yml présent
    - mirror.yml présent
    - secrets opérationnels

1.7 SCAN AUTOMATISÉ — Domaine Vercel (OBLIGATOIRE)  
L’agent doit automatiquement analyser :  
  - accessibilité HTTP  
  - certificat SSL  
  - redirections (200 / 301 / 308 / 404 / 500)  
  - réponse du CDN  
  - cohérence domaine principal / www  
Aucune confirmation utilisateur requise.

Domaine(s) :  
  https://qrpruf.sanadidari.com  
  https://www.qrpruf.sanadidari.com  

----------------------------------------------------------------------
2. RAPPORT INITIAL — FORMAT OBLIGATOIRE

L’agent doit produire EXACTEMENT :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON  
2. Mirror repo access: OK/NON  
3. Docs loaded: <liste>  
4. Last commit (private): <hash>  
5. Last commit (mirror): <hash>  
6. Sync status: SYNC / OUTDATED  
7. NEXT ACTION: <contenu>  
8. Domain scan: <résultat automatique>

QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

STOP.

----------------------------------------------------------------------
3. RÈGLE D’OR — UNE SEULE ACTION PAR ÉTAPE

Cycle :
  - validation  
  - exécution  
  - fichier complet  
  - commandes git  
  - mise à jour docs  
STOP.

----------------------------------------------------------------------
4. INTERDICTIONS ABSOLUES

❌ inventer un fichier  
❌ inventer une action  
❌ modifier sans validation  
❌ modifier plusieurs fichiers  
❌ ignorer le SCAN AUTOMATISÉ  
❌ modifier build/web  
❌ ignorer NEXT_ACTION

----------------------------------------------------------------------
FIN DU FICHIER — AGENT_PROTOCOL.md v2.1
