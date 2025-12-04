📄 AGENT_STARTUP_CHECKLIST.md — Version PRO
✅ Checklist de démarrage Agents GPT

Projet : Sanad Idari — empreinte_verif

Cette checklist doit être exécutée avant toute réponse technique, dans l’ordre strict ci-dessous.

1. 🔐 Vérification accès GitHub
1.1 Tester accès au dépôt public

URL :
https://github.com/sanadidari/empreinte_verif

Si public → continuer

Si privé → passer à 1.2

1.2 Tester les URLs RAW GitHub

Exemples :

https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/AGENT_START.md
https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/STATE_PROJECT.md
https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/NEXT_ACTION.md

1.3 Si l'accès échoue → demander utilisateur

Rendre public

Envoyer liens RAW

Copier/coller docs

Créer repo public /docs

⚠️ Ne pas continuer tant que la lecture effective n’est pas confirmée.

2. 📚 Lecture obligatoire des fichiers /docs

Lire dans cet ordre exact :

AGENT_START.md

AGENT_STARTUP_CHECKLIST.md

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE_VERCEL.md

TASKS.md

CHECKLIST_MASTER.md (si présent)

Pour chaque fichier :

Lire

Vérifier

Noter la source (GitHub / RAW / collé)

3. 🧩 Vérifications du dépôt GitHub

L’agent doit confirmer :

✔ 3.1 Structure Flutter

pubspec.yaml présent

dossier lib/ présent

dossier web/ présent

compatibilité Flutter Web

✔ 3.2 Pipeline Vercel

présence éventuelle de vercel.json

état du dernier commit

branche main active

✔ 3.3 Santé du code

Aucune erreur manifeste dans la structure

Pas d’incohérence Flutter Web

4. 🧠 Lecture du projet (SYNTHÈSE)

Après lecture complète, l’agent doit identifier :

Le but global du projet

L’état réel actuel

La next action officielle

Les risques éventuels

Les fichiers à corriger prochainement

5. 🚀 Préparation de la première réponse

La première réponse de l’agent doit obligatoirement contenir :

Résumé du projet

Résumé du state actuel

La next action officielle

Plan étape 1 (une seule action)

Demande explicite de validation utilisateur

6. ❌ Conditions d'arrêt (ne pas continuer si…)

L’agent doit STOPPER l’exécution si :

Impossible de lire /docs

Impossible d’accéder au repo ou aux RAW

Fichiers /docs manquants

Incohérence détectée dans STATE_PROJECT.md

Next Action absente ou contradictoire

Et doit demander immédiatement la correction à l’utilisateur.

7. 🟦 Après validation

Une fois l’étape 1 validée par l’utilisateur :

Exécuter l’action

Fournir fichiers complets modifiés

Mettre à jour :

STATE_PROJECT.md

TASKS.md

Tout fichier impacté

Ne jamais enchaîner plusieurs actions à la fois

✔ FIN DU FICHIER