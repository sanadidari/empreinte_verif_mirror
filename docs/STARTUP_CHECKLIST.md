## STARTUP_CHECKLIST.md — STARTUP PROTOCOL v2.1
Projet : empreinte_verif — Agents GPT — Strict Military Mode

Cette checklist définit les actions obligatoires, dans l’ordre, qu’un
agent GPT doit effectuer avant toute réponse.

----------------------------------------------------------------------
1. VÉRIFICATION ACCÈS GITHUB

1.1 Repo privé  
  - accès repo  
  - RAW  
  - dossiers /docs /lib /web  
  - workflows  
  - dernier commit  

1.2 Repo miroir public  
  - accessibilité  
  - cohérence commits  
  - statut SYNC

----------------------------------------------------------------------
2. LECTURE OBLIGATOIRE DES DOCUMENTS

Ordre strict :
  AGENT_PROTOCOL.md  
  STARTUP_CHECKLIST.md  
  NEXT_ACTION.md  
  STATE_PROJECT.md  
  RULES.md  
  ARCHITECTURE.md  
  HISTORY.md  
  DEPLOY_GUIDE.md  
  TASKS.md  

----------------------------------------------------------------------
3. VÉRIFICATION STRUCTURE PROJET  
/pubspec.yaml, /lib, /web, /android, /ios  
/github/workflows : build_web.yml, mirror.yml

----------------------------------------------------------------------
4. VÉRIFICATION SECRETS  
MIRROR_DEPLOY_KEY  
VERCEL_TOKEN

----------------------------------------------------------------------
5. VÉRIFICATION CI/CD  
build_web.yml  
mirror.yml  
commandes Flutter  
output build/web

----------------------------------------------------------------------
6. ANALYSE NEXT_ACTION.md  
Extraire la prochaine action.  
Ne rien inventer.

----------------------------------------------------------------------
7. SCAN AUTOMATISÉ DU DOMAINE VERCEL (OBLIGATOIRE)
L’agent doit analyser automatiquement :  
  - HTTP response  
  - SSL  
  - redirections  
  - erreurs CDN  
  - cohérence domaine / www  

Domaine :  
https://qrpruf.sanadidari.com

Aucune autorisation requise.

----------------------------------------------------------------------
8. RAPPORT INITIAL  
L’agent doit produire :

[STARTUP CHECK COMPLETE]

1. Repo privé: OK/NON  
2. Repo miroir: OK/NON  
3. Docs chargés: <liste>  
4. Dernier commit privé: <hash>  
5. Dernier commit miroir: <hash>  
6. Sync status: <SYNC/OUTDATED>  
7. NEXT ACTION: <contenu>  
8. Domain scan: <résultat>  

Puis STOP.

----------------------------------------------------------------------
FIN DU FICHIER — STARTUP_CHECKLIST.md v2.1
