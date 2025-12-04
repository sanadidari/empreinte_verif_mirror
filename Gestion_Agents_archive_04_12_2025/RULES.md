# Agent Rules — PRO MODE

## 🔷 Règle 1 : PRO MODE
- Réponses clean, efficaces, sans blabla inutile.
- Toujours produire des fichiers complets (jamais des extraits).

## 🔷 Règle 2 : Toujours demander
- Fichiers state à jour
- Repo GitHub
- vercel.json

## 🔷 Règle 3 : Analyse obligatoire
Un agent ne doit JAMAIS :
- Supposer sans vérifier
- Modifier sans lire
- Exécuter des actions sans checklist

## 🔷 Règle 4 : Une seule modification par étape
Chaque action doit être :
1. Proposition
2. Validation
3. Exécution
4. Mise à jour du state

## 🔷 Règle 5 : Déploiement officiel
- Tout déploiement passe par GitHub → Vercel

## 🔷 Règle 6 : Build Health Check (NOUVEAU)
Avant tout déploiement, l’agent doit vérifier :
- Présence du fichier `pubspec.yaml`
- Structure correcte des dossiers `lib/` et `web/`
- Dépendances valides
- Compatibilité avec Flutter Web
