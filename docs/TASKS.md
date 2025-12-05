## TASKS.md — MISSION TASK MATRIX (MTM-1)
Projet : empreinte_verif  
Classification : OPÉRATIONNEL / STRICT / ZERO-ERROR

Ce fichier définit toutes les tâches du projet, réparties en quatre états :
TERMINÉ, EN COURS, À FAIRE, BLOQUÉ.

Aucune tâche ne peut être inventée.  
Un agent GPT ne doit manipuler que ce qui est écrit ici.

----------------------------------------------------------------------
1. TERMINÉ — Missions accomplies

🔧 Infrastructure & Migration
- Abandon HostPapa  
- Migration complète vers Vercel  
- Configuration DNS → HostPapa → Vercel  
- Activation SSL  
- Routage SPA corrigé (vercel.json)

🛠 Flutter & Front-End
- Build Flutter Web validé  
- Page blanche corrigée  
- Test responsive validé

📚 Documentation
- Création du système documentaire /docs  
- Passage en PRO MODE agents GPT  
- Réécriture totale en mode MILITAIRE  
- Documentation v2.0 déployée  
- Purge complète ancienne documentation  
- STANDARDISATION finale : 12 fichiers militaires PRO

🔐 CI/CD & Sécurité
- Installation workflow build_web.yml  
- Installation workflow mirror.yml  
- Création clé SSH pour miroir  
- Création secret MIRROR_DEPLOY_KEY  
- Création secret VERCEL_TOKEN  
- Miroir public opérationnel  
- Synchronisation repo privé → miroir validée

🟦 Agents & Protocole
- Mise à jour AGENT_START.md vers version auto-boot v2.0  
  (message de démarrage militaire, SCANS automatiques,  
   génération du rapport Level Red)  
  Résultat :  
  ✔ Agents démarrent en protocole strict automatiquement  
  ✔ Plus aucune demande manuelle de fichiers /docs

----------------------------------------------------------------------
2. EN COURS — Missions actives

🚀 Déploiement automatique Flutter Web → Vercel  
Tâches opérationnelles :  
- Vérifier CI/CD (build_web.yml)  
- Vérifier Vercel deploy  
- Tester domaine final  
- Inspecter logs Vercel  
- Mettre à jour documentation  

⚠ Cette mission correspond EXACTEMENT à la NEXT ACTION officielle.

----------------------------------------------------------------------
3. À FAIRE — Missions programmées

🟩 API Backend (Phase 2)
- Construire endpoint /scan  
- Recevoir empreinte en base64  
- Analyse et réponse JSON  
- Sécurisation Token

🟩 Intégration API Flutter (Phase 3)
- Appeler API depuis Flutter  
- Afficher résultat  
- Gestion erreurs

🟦 Développement Mobile (Phase 4)
- Permissions empreinte Android  
- Tests matériel fingerprint  
- UI mobile dédiée

🟧 Optimisations (Phase 5)
- Sécurité  
- Performance Flutter Web  
- Compression assets  
- SEO Web  
- Logs système

🟪 Infrastructure (Optionnel)
- Versioning Releases  
- Mode Maintenance  
- Rollback automatique  
- Notifications Discord

----------------------------------------------------------------------
4. BLOQUÉ — En attente ou impossible

Aucune mission bloquée actuellement.

Si un agent détecte un blocage (clé manquante, workflow cassé,
repo inaccessible), il doit l’ajouter immédiatement ici.

----------------------------------------------------------------------
5. RÈGLES STRICTES DE MISE À JOUR

Chaque modification doit être accompagnée de :

Commandes :
  git add .
  git commit -m "update tasks: <description>"
  git push

Et mise à jour simultanée des fichiers :
- STATE_PROJECT.md  
- HISTORY.md (optionnel)  
- Le fichier modifié

Aucune tâche ne peut être déplacée sans succès vérifié.

----------------------------------------------------------------------
FIN DU FICHIER — TASKS.md v2.0
