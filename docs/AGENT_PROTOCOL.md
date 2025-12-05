## AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE v3.0
Projet : empreinte_verif
Classification : STRICT — ZERO-ERROR — CLASSIFIÉ

Ce protocole définit les règles absolues que tout agent GPT appliquera
immédiatement au démarrage d'une session. Objectif : autonomie maximale
pour l'analyse, la détection et la prévention d'erreurs — l'humain reste
responsable des vérifications visuelles et des commits finaux.

----------------------------------------------------------------------
0. OBJECTIF

Chaque agent doit :
  - charger le miroir public automatiquement
  - lire /docs dans l'ordre militaire
  - exécuter une suite complète de SCANS automatiques :
      • Git (repo privé + miroir)
      • Docs (cohérence)
      • Infra (CI/CD, Vercel, DNS)
      • Domaine (HTTP/SSL/redirections)
      • Code (FULL CODE INTELLIGENCE)
      • Diff / sécurité / prédictif
  - produire rapports structurés
  - proposer corrections et PRs draft si autorisé
  - EXÉCUTER seulement après validation humaine les actions mutantes

----------------------------------------------------------------------
1. SCANS OBLIGATOIRES (Séquence automatique)

1.1 SCAN GIT (privé)
  - Vérifier accès, derniers commits, état branche main.
  - Hash privé, hash miroir, différence.

1.2 SCAN MIROIR (source de lecture)
  - Vérifier accessibilité miroir public.
  - Vérifier présence /docs et fichiers obligatoires.

1.3 SCAN DOCS (lecture obligatoire)
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
    CHECKLIST_MASTER.md (si présent)

1.4 SCAN CI/CD
  - Vérifier build_web.yml, mirror.yml.
  - Vérifier install Flutter step, commandes build, vercel CLI usage.
  - Analyser risques de fail (dépendances manquantes, version Flutter).

1.5 SCAN DOMAINE (HTTP/SSL) — AUTOMATIQUE
  - Tester : HTTP status, redirections, SSL cert validity, WWW vs apex.
  - Test de fallback SPA (index.html fallback status).
  - Rapporter anomalies (timeouts, 4xx, 5xx, redirect loops).

1.6 SCAN CODE — FULL CODE INTELLIGENCE (FCI) — OBLIGATOIRE
  L'agent analyse automatiquement :
    - structure du projet (lib/, web/, assets/)
    - pubspec.yaml (dépendances, versions)
    - main.dart et routes critiques
    - imports cassés ou orphelins
    - usages non-web compatibles (dart:io, platform channels non gérés)
    - assets référencés mais non présents
    - patterns anti-perf (rebuilds excessifs, widgets lourds)
    - appels asynchrones non awaités potentiellement dangereux
    - usages non sécurisés d'APIs externes
  L'agent produit :
    - liste d'anomalies classée par SEVERITY
    - suggestions de correction (patch snippets)
    - estimation de risque (probabilité d'échec build/release)

1.7 SCAN INFRASTRUCTURE AVANCÉ
  - Vérification vercel.json (fallback, routes)
  - Vérification secrets GitHub (noms & existence)
  - Vérification clé MIRROR_DEPLOY_KEY write access
  - Vérification CNAME / DNS propagation (via public DNS checks)
  - Estimation de délai de propagation si nécessaire

1.8 SCAN DIFF / IDS (Smart Diff)
  - Comparer dernier commit vs baseline (dernière version vérifiée)
  - Détecter suppressions massives, fichiers binaires ajoutés, clé exposée
  - Marquer modifications suspectes et alerter

1.9 SCAN PRÉDICTIF
  - Sur la base du code + historique, estimer probabilité d'échec build
  - Identifier lignes/commits les plus risqués
  - Proposer tests additionnels à exécuter

----------------------------------------------------------------------
2. RAPPORT INITIAL — FORMAT OBLIGATOIRE

Après tous les SCANS, l'agent produit EXACTEMENT :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: <OK/NON>
2. Mirror repo access: <OK/NON>
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: <SYNC / OUTDATED>
7. NEXT ACTION: <contenu exact>
8. Domain scan: <OK / WARN / FAIL> + summary
9. Code intelligence: <OK / WARN / FAIL> + key findings
10. Infra summary: <OK / WARN / FAIL>

QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

L’agent DOIT STOPPER ensuite et attendre validation humaine.

----------------------------------------------------------------------
3. ACTIONS PRATIQUES ET LIMITES

- L'agent PEUT proposer patches, PR drafts et scripts de correction.
- L'agent NE PEUT PAS exécuter de builds ni de commandes sur ton poste.
- L'agent NE DOIT PAS pousser des modifications mutantes sans validation.
- Pour tout fix visuel ou runtime, l'agent demandera captures d'écran & logs.

----------------------------------------------------------------------
4. AUTONOMIE ÉTENDUE (Règles v3.0)

- Exécution automatique de l'ensemble des SCANS en entrée de session.
- Analyse complète du code et infra sans demande préalable.
- Notification synthétique à l'humain (toi) des anomalies critiques.
- Propositions de corrections en PR draft (optionnel) — à activer par toi.
- Conservation d'un historique des recommandations (HISTORY.md update).

----------------------------------------------------------------------
5. INTERDICTIONS ABSOLUES

❌ Exposer clé privée ou secrets
❌ Pousser modifications sans validation humaine
❌ Modifier build/web
❌ Ignorer les captures visuelles quand requises
❌ Remplacer NEXT_ACTION sans approbation

----------------------------------------------------------------------
6. MISE EN SÉCURITÉ & AUDIT

- L'agent conserve un log interne (audit) des alertes importantes.
- Tout changement majeur entraîne une entrée HISTORY.md (draft).

----------------------------------------------------------------------
FIN DU FICHIER — AGENT_PROTOCOL.md v3.0 (FULL INTELLIGENCE)
