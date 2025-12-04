📄 HISTORY.md — OPERATIONAL HISTORY DOSSIER (OHD-1)
Projet : empreinte_verif — Classification : ARCHIVE / RÉFÉRENCE STRATÉGIQUE
🧭 1. PURPOSE OF THIS FILE — Pourquoi ce dossier existe

Ce fichier documente l’historique complet, chronologique, factuel et vérifié du projet empreinte_verif.
Aucune supposition.
Aucune opinion.
Aucune omission.

C’est un journal militaire, utilisé pour :

audit technique

suivi d’évolution

diagnostic infrastructure

transfert inter-agents GPT

analyse des incidents passés

📅 2. HISTORIQUE CHRONOLOGIQUE
🟥 2025-12-01 — Abandon définitif de HostPapa
Problèmes constatés :

FTP instable

SSH verrouillé

Incompatibilité Flutter Web

Hébergement non adapté aux applications SPA

Déploiement manuel trop fragile

Actions :

Backup manuel des fichiers

Désactivation des scripts locaux

Décision stratégique : migration vers Vercel

🟦 2025-12-02 — Création de la base Flutter Web
Actions :

Initialisation du projet Flutter

Création UI (scanner / layout responsive)

Mise en place des assets

Vérification du build local Web

Ajout des premières pages + tests de rendu

Résultat :
✔ Application fonctionnelle en local
✔ Structure Flutter stable

🟩 2025-12-03 — Mise en place du système documentaire
Actions :

Création du dossier /docs

Ajout des fichiers de gouvernance

Début du “PRO MODE” agents GPT

Normalisation du style documentaire

Centralisation des instructions

Résultat :
✔ Documentation opérationnelle
✔ Agents synchronisés
✔ Cohérence des réponses

🟧 2025-12-04 — Migration Vercel + Correctifs
Actions :

Création projet Vercel

Ajout du domaine qrpruf.sanadidari.com

Configuration DNS HostPapa → Vercel

Ajout du fichier vercel.json

Correction du routing SPA

Correction page blanche Flutter Web

Tests navigateur

Vérification SSL

Résultat :
✔ Déploiement Vercel fonctionnel
✔ Routage SPA correct
✔ Aucune 404 interne

🟪 2025-12-04 — CI/CD Installation
Actions :

Création workflow build_web.yml

Installation Flutter dans GitHub Actions

Configuration déploiement automatique

Vérification des logs

Ajout VERCEL_TOKEN dans secrets GitHub

Résultat :
✔ Build Web automatisé
✔ Déploiement Vercel automatisé

🟥 2025-12-05 — Création du système miroir GitHub
Enjeux :

Les agents GPT ne peuvent pas accéder au repo privé, donc :

→ création d’un repo miroir public
→ synchronisé automatiquement via SSH

Actions :

Création clé SSH mirror_deploy_key

Ajout clé publique au repo miroir (write access)

Ajout clé privée dans repo privé (secret GitHub)

Création workflow mirror.yml

Debug du workflow

Correction du nom du secret

Tests de synchronisation

Résultat :
✔ Miroir public opérationnel
✔ Agents GPT peuvent lire le code à tout moment
✔ Synchronisation fiable

🟦 2025-12-06 — Passage en MODE MILITAIRE
Actions :

Réécriture totale des fichiers /docs

Mise en place du PROTOCOLE MILITAIRE GPT

Ajout des règles strictes :

une seule action par étape

scans obligatoires

rapport initial systématique

Mise en place des fichiers PRO :

AGENT_PROTOCOL.md

STARTUP_CHECKLIST.md

NEXT_ACTION.md

RULES.md

ARCHITECTURE.md

STATE_PROJECT.md

TASKS.md

Résultat :
✔ Système PRO ultra-stable
✔ Agents toujours synchronisés
✔ Zero-Error Workflow

🟩 3. STATUT ACTUEL (LIVE STATUS)

Flutter Web stable

Pipeline CI/CD fonctionnel

Miroir GitHub opérationnel

Documentation militaire active

Domaine Vercel actif

Agents sous PROTOCOL strict

🟦 4. PROCHAINES ENTRÉES HISTORIQUES (À AJOUTER)

Les actions suivantes devront être ajoutées ici quand réalisées :

Premier déploiement complet via CI

Activation API Backend

Version mobile Android

Versioning et releases

Tests utilisateurs

Optimisation SEO Flutter Web

🟥 FIN DU FICHIER 7/10 — HISTORY.md