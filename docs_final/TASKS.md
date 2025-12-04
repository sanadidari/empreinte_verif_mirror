📄 TASKS.md — MISSION TASK MATRIX (MTM-1)
Projet : empreinte_verif — Classification : OPÉRATIONNEL / STRICT / ZERO-ERROR

Ce fichier définit toutes les tâches du projet, réparties en quatre états :

TERMINÉ

EN COURS

À FAIRE

BLOQUÉ

Seules les tâches validées et écrites ici sont autorisées.
Un agent GPT ne doit jamais inventer une tâche.

🟩 1. TERMINÉ — Missions accomplies
🔧 Infrastructure & Migration

Abandon HostPapa

Migration complète vers Vercel

Configuration DNS → HostPapa → Vercel

Activation SSL

Routage SPA corrigé (vercel.json)

🛠 Flutter & Front-End

Build Flutter Web validé

Page blanche corrigée

Test responsive validé

📚 Documentation

Création du système documentaire /docs

Passage en PRO MODE agents GPT

Réécriture totale en mode MILITAIRE

🔐 CI/CD & Sécurité

Installation workflow build_web.yml

Installation workflow mirror.yml

Création clé SSH pour miroir

Création secret MIRROR_DEPLOY_KEY

Création secret VERCEL_TOKEN

Miroir public opérationnel

🟦 2. EN COURS — Missions actives
🚀 Déploiement automatique Flutter Web → Vercel
Action militaire en cours :

Vérifier CI/CD (build_web.yml)

Vérifier Vercel deploy

Tester domaine final

Inspecter logs Vercel

Mettre à jour documentation

Cette action correspond à la NEXT ACTION officielle.

🟨 3. À FAIRE — Missions programmées

Ces tâches ne peuvent commencer qu’après finalisation de la NEXT ACTION :

🟩 API Backend (Phase 2)

Construire endpoint /scan

Recevoir empreinte en base64

Analyser & répondre JSON

Gérer sécurité (Token)

🟩 Intégration API Flutter (Phase 3)

Appeler API depuis Flutter

Afficher résultat

Gestion erreurs

🟦 Développement Mobile (Phase 4)

Permissions Android biométriques

Test hardware fingerprint

UI mobile dédiée

🟧 Optimisations (Phase 5)

Sécurité

Performance Flutter Web

Compression assets

SEO Web

Logs système

🟪 Infrastructure (Optionnel)

Versioning Releases

Mode Maintenance

Rollback automatique

Notifications Discord

🟥 4. BLOQUÉ — En attente ou impossible

Aucune mission bloquée actuellement.
Si un agent détecte un blocage (clé manquante, workflow cassé, repo inaccessible), il doit l’ajouter ici immédiatement.

🟦 5. RÈGLES STRICTES DE MISE À JOUR

Un agent GPT doit mettre à jour ce fichier après toute modification opérationnelle :

Ajouter tâche → uniquement avec validation utilisateur

Déclarer tâche terminée → uniquement après réussite

Déplacer tâche EN COURS → TERMINÉ → uniquement via NEXT ACTION

Chaque modification doit être accompagnée de :

Commandes :
git add .
git commit -m "update tasks: <description>"
git push

Mises à jour synchronisées :

STATE_PROJECT.md

HISTORY.md (optionnel)

🟥 FIN DU FICHIER 9/10 — TASKS.md