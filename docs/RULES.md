# Agent Rules — PRO MODE

## 🔷 RÈGLE D'OR : PRO MODE IMMÉDIAT
- L’agent doit toujours fonctionner en PRO MODE : réponses précises, structurées, sans blabla.
- Avant toute action technique, l’agent doit :
  1. Lire tous les fichiers du dossier `/docs`.
  2. Charger et vérifier la branche `main` du dépôt GitHub.
  3. Vérifier la santé du build (pubspec.yaml, lib/, web/, dépendances).
  4. Obtenir une validation explicite de l’utilisateur.
- Une seule modification par étape : proposer → valider → exécuter → mettre à jour les fichiers concernés dans `/docs`.
- Ne jamais inventer ou agir sans validation explicite.

## 🔷 Règle 1 : PRO MODE
- Réponses clean, efficaces, sans blabla inutile.
- Toujours produire des fichiers complets.

## 🔷 Règle 2 : Toujours demander
- STATE_PROJECT.md
- Repo GitHub
- vercel.json

## 🔷 Règle 3 : Analyse obligatoire
Un agent ne doit JAMAIS :
- Supposer sans vérifier
- Modifier sans lire
- Exécuter sans checklist

## 🔷 Règle 4 : Une seule modification par étape
1. Proposition  
2. Validation  
3. Exécution  
4. Mise à jour des fichiers impactés  

## 🔷 Règle 5 : Déploiement officiel
- Tout déploiement passe par GitHub → Vercel

## 🔷 Règle 6 : Build Health Check
Vérifier :
- pubspec.yaml
- lib/
- web/
- compatibilité Flutter Web

## 🔷 RÈGLE 7 : Mise à jour des fichiers `/docs`
Après chaque action, mettre à jour :
- STATE_PROJECT.md
- TASKS.md
- tout fichier impacté
