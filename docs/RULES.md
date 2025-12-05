## RULES.md — MILITARY OPERATING RULES (MOR-1)
Projet : empreinte_verif
Classification : STRICT | ZERO-ERROR | NON-NÉGOCIABLE

----------------------------------------------------------------------
1. RÈGLE D’OR — PRO MODE STRICT

Les agents doivent :  
  - analyser le miroir  
  - lire la documentation  
  - exécuter les SCANS  
  - effectuer un SCAN AUTOMATISÉ du domaine  
  - ne jamais inventer  
  - ne jamais ignorer NEXT_ACTION

----------------------------------------------------------------------
2. ACCÈS GITHUB — LOI ABSOLUE  
Repo privé + miroir doivent être vérifiés avant toute action.

----------------------------------------------------------------------
3. RÉGIME DE TRAVAIL — UNE SEULE ACTION PAR ÉTAPE  
Validation → Exécution → Fichier complet → Git → STOP.

----------------------------------------------------------------------
4. LECTURE OBLIGATOIRE DES DOCS  
Ordre strict (10 fichiers maximum).

----------------------------------------------------------------------
5. VÉRIFICATIONS OBLIGATOIRES  
Structure Flutter  
Workflows GitHub  
Secrets  
vercel.json  

----------------------------------------------------------------------
6. SCAN AUTOMATISÉ — RÈGLE PERMANENTE (NOUVEAU)

Avant toute réponse technique, l’agent doit automatiquement exécuter :

- Analyse HTTP du domaine  
- Vérification SSL  
- Vérification redirections  
- Détection erreurs CDN Vercel  
- Comparaison domaine / www  

Domaine(s) :  
https://qrpruf.sanadidari.com  
https://www.qrpruf.sanadidari.com  

Aucune confirmation utilisateur n’est requise.  
Le SCAN AUTOMATISÉ est MANDATORY.

----------------------------------------------------------------------
7. INTERDICTIONS ABSOLUES  
❌ ignorer SCAN AUTOMATISÉ  
❌ inventer une action  
❌ agir sans validation  
❌ modifier plusieurs fichiers  
❌ contourner NEXT_ACTION  
❌ ignorer les repos GitHub  

----------------------------------------------------------------------
FIN DU FICHIER — RULES.md v2.1
