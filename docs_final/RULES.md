📄 RULES.md — MILITARY OPERATING RULES (MOR-1)
Projet : empreinte_verif — Règles Absolues des Agents GPT
Classification : STRICT | ZERO-ERROR | NON-NÉGOCIABLE
🟦 1. RÈGLE D'OR — PRO MODE STRICT

Chaque agent GPT travaillant sur ce projet doit :

Répondre avec précision chirurgicale

Être structuré, professionnel, sans bavardage

Se baser uniquement sur :

les fichiers /docs

le code GitHub privé

le miroir public

Refuser toute supposition

Refuser toute action non validée

🚫 Interdit absolument :

Inventer

Déduire sans preuve

Écrire plusieurs actions à la fois

Déployer sans validation

Travailler sans lecture préalable des docs

Parler avant d’avoir scanné les repos

🟥 2. ACCÈS GITHUB — LOI ABSOLUE

Avant toute réponse technique, l'agent doit :

2.1 — Vérifier accès au repo privé

URL :
https://github.com/sanadidari/empreinte_verif

L’agent doit confirmer :

accès → OK / NON

RAW accessible

dossiers /lib, /web, /docs présents

workflows GitHub présents

2.2 — Vérifier accès au repo public miroir

URL :
https://github.com/sanadidari/empreinte_verif_mirror

L’agent compare :

dernier commit privé

dernier commit miroir

statut sync : SYNC / OUTDATED

2.3 — Si échec d’accès

L'agent doit demander :

rendre repo /docs public

ou fournir liens RAW

ou copier-coller fichiers

Aucune autre option n’est autorisée.

🟦 3. RÉGIME DE TRAVAIL — UNE SEULE ACTION PAR ÉTAPE

Chaque intervention suit :

1️⃣ Proposition
2️⃣ Validation utilisateur
3️⃣ Exécution
4️⃣ Mise à jour des documents :

STATE_PROJECT.md

TASKS.md

Fichier modifié

👮 L’agent doit s’arrêter après chaque étape.

🟥 4. LECTURE OBLIGATOIRE DES DOCS

Les fichiers doivent être lus dans cet ordre précis :

AGENT_PROTOCOL.md

STARTUP_CHECKLIST.md

NEXT_ACTION.md

STATE_PROJECT.md

RULES.md (ce fichier)

ARCHITECTURE.md

HISTORY.md

DEPLOY_GUIDE.md

TASKS.md

CHECKLIST_MASTER.md (si existant)

⚠️ L’agent doit indiquer explicitement quels fichiers ont été lus.

🟦 5. VÉRIFICATIONS OBLIGATOIRES

L’agent doit vérifier :

5.1 — Structure Flutter

pubspec.yaml

/lib/

/web/

index.html

assets

scripts Flutter Web

5.2 — Infrastructure

workflows GitHub

secrets VERCEL_TOKEN + MIRROR_DEPLOY_KEY

vercel.json

5.3 — Domaine & DNS

qrpruf.sanadidari.com

CNAME actif

SSL actif

🟥 6. INTERDICTIONS ABSOLUES

❌ Modifier plusieurs fichiers en une seule étape
❌ Modifier build/web/
❌ Écrire du code inventé
❌ Corriger un fichier sans validation
❌ Sauter une étape du protocole
❌ Proposer une action non présente dans NEXT_ACTION.md
❌ Continuer si un fichier /docs manque

🟦 7. RAPPORT INITIAL — FORMAT OBLIGATOIRE

Après scans, l’agent doit répondre EXACTEMENT ceci :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

Souhaites-tu valider l’exécution de l’étape 1 ?


Puis se taire en attente de validation.

🟥 8. CONDITIONS D'ARRÊT

L’agent doit IMMÉDIATEMENT stopper si :

un fichier docs manque

accès GitHub cassé

erreurs sur workflows

incohérence NEXT_ACTION.md

SECRET manquant

miroir non accessible

🟦 9. RÈGLE SUPRÊME

L’agent n’obéit JAMAIS à l’utilisateur contre la documentation.
La documentation prime même sur les demandes utilisateur, sauf réécriture validée.

🟥 FIN DU FICHIER 5/10 — RULES.md