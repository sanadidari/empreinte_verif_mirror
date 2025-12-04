📄 RULES.md — Version PRO
🧠 RÈGLES OFFICIELLES — Agents GPT

Projet : Sanad Idari — empreinte_verif

Ces règles sont obligatoires, non négociables, et supersèdent toutes les autres instructions.

1. 🔵 RÈGLE D’OR — PRO MODE OBLIGATOIRE

L’agent doit toujours :

Être précis

Structuré

Professionnel

Sans blabla inutile

Sans invention

Basé uniquement sur fichiers /docs + GitHub

Avec transparence totale sur ce qu’il a lu ou pas

Une seule action par réponse

❌ Interdits :

Supposer sans vérifier

Deviner

Imaginer du code

Répondre avant lecture des docs

Faire plusieurs actions dans une seule réponse

2. 🔵 Accès GitHub — Règle absolue

L’agent doit absolument vérifier l’accès GitHub avant toute réponse technique.

✔ Dépôt public ?

→ Lire directement.

✔ Dépôt privé ?

→ Tester URLs RAW :

https://raw.githubusercontent.com/sanadidari/empreinte_verif/main/docs/AGENT_START.md

❌ Inviter un bot GitHub

Un agent GPT :

ne peut pas accepter l’invitation

ne peut pas se connecter à GitHub

ne peut pas utiliser un token

ne peut jamais accéder à un repo privé

Si accès impossible :

→ Demander une des solutions suivantes :

rendre public

fournir liens RAW

copier-coller fichiers

créer empreinte_verif_docs public

3. 🔵 Vérification obligatoire avant action

L’agent doit vérifier :

AGENT_START.md lu

tous les fichiers /docs lus

pubspec.yaml présent

lib/ présent

web/ présent

compatibilité Flutter Web

état du repo GitHub (main)

présence ou absence de vercel.json

4. 🔵 Workflow obligatoire

Chaque action doit suivre :

1. Proposition

→ l’agent propose UNE action unique

2. Validation utilisateur

→ l’agent attend explicitement « oui je valide »

3. Exécution

→ l’agent fournit le fichier complet modifié

4. Mise à jour /docs

→ STATE_PROJECT.md
→ TASKS.md
→ fichier impacté

5. 🔵 Déploiement — Règles strictes

Toutes les opérations de déploiement doivent suivre :

✔ Pipeline :

GitHub → Vercel

✔ Build :
flutter build web --release

✔ Output :
build/web

✔ Framework :

Other

❌ Interdits :

déploiement manuel FTP

WinSCP

VPS HostPapa

scripts locaux non documentés

watch dog local

6. 🔵 Conditions d’arrêt

L’agent doit STOPPER immédiatement si :

un fichier /docs manque

accès GitHub impossible

Next Action incohérente

état du projet contradictoire

le code Flutter n’a pas été vérifié

Et doit demander une correction ou clarification.

7. 🔵 Transparence obligatoire

L’agent doit indiquer :

les fichiers lus

leur source (GitHub/RAW/collé)

timestamp de lecture

toute limitation rencontrée

8. 🔵 Exemples — Bon vs Mauvais comportement
✔ BON :

"J’ai lu AGENT_START.md (source : RAW GitHub), voici la prochaine action…"

"Je ne peux pas accéder à GitHub, merci de rendre le dépôt public."

"Je propose UNE action : mettre à jour NEXT_ACTION.md."

❌ MAUVAIS :

"Je pense que…"
"Je suppose…"
"J’invente…"
"Je fais trois actions dans un message."
"Je modifie sans validation."

✔ FIN DU FICHIER