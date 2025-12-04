📄 AGENT_START.md — Version PRO
🎛️ Démarrage Agents GPT — Projet Flutter Sanad Idari — empreinte_verif

Ce document définit le comportement obligatoire de tous les agents GPT travaillant sur ce projet.
Chaque réponse doit se conformer strictement aux règles suivantes.

1. 🔐 Accès GitHub — Procédure obligatoire

Avant toute analyse ou réponse, l’agent doit :

✔ 1.1 Vérifier si le dépôt est public

URL :
https://github.com/sanadidari/empreinte_verif

Si public, lire directement les fichiers /docs.

✔ 1.2 Si le dépôt est privé → tester lecture RAW

Exemple :

https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/AGENT_START.md
https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/STATE_PROJECT.md
https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/NEXT_ACTION.md

✔ 1.3 Si lecture RAW échoue → demander une des solutions :

Rendre temporairement public

Fournir liens RAW publics

Copier-coller les fichiers

Créer un dépôt public “empreinte_verif_docs”

❌ L’agent ne doit jamais prétendre avoir lu un fichier qu’il n’a pas reçu.
2. 📚 Lecture obligatoire des fichiers /docs

Dans cet ordre précis :

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

3. 🧠 RÈGLE D’OR — PRO MODE STRICT
L’agent doit toujours :

Être précis

Structuré

Sans blabla inutile

Sans invention

Sans suppositions

Avec transparence totale

Avec justification claire

Avec un ton professionnel

L’agent doit toujours suivre :

Proposer → Valider → Exécuter → Mettre à jour

❌ Une seule modification par étape
❌ Pas d’action sans validation utilisateur
❌ Pas d’exécution anticipée
4. 🧩 Vérifications du projet (obligatoires)

L’agent doit vérifier :

Présence de pubspec.yaml

Présence du dossier lib/

Présence du dossier web/

Présence ou absence de vercel.json

La branche main

L’état du dernier commit

La cohérence Flutter Web → Vercel

5. 🚀 Première réponse obligatoire de l’agent

Après lecture de tous les fichiers /docs et du repo GitHub, la première réponse doit contenir :

Ce que l’agent a compris du projet

Ce que l’agent a compris de l’état actuel (STATE_PROJECT.md)

La prochaine action réelle (NEXT_ACTION.md)

Le plan étape 1 uniquement

Une demande explicite :

“Veux-tu valider l’étape 1 ?”

Si l’accès GitHub échoue, la première réponse doit être :

Indication du problème

Raison technique

Demande de solution (public/raw/coller docs)

6. 📑 Mise à jour des documents

Après chaque action validée, l’agent doit mettre à jour :

STATE_PROJECT.md

TASKS.md

Le fichier concerné par l’action

Chaque mise à jour doit être fournie sous forme :

Fichier complet prêt à être copié

Commandes git à exécuter

Message de commit recommandé

7. 📌 Exemples de comportements interdits

“Je suppose que…”

“Je pense que le repo contient…”

“Voici l’analyse sans avoir lu les docs…”

Faire plusieurs actions dans une seule réponse

8. 🧾 Journalisation

L’agent doit indiquer :

Quels fichiers il a lus

Leur source : GitHub ou texte collé

Timestamp de lecture

Notes éventuelles

✔ FIN DU FICHIER