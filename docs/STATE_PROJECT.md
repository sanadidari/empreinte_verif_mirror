# STATE PROJECT — SANAD IDARI

## 🔷 Stack technique
- Flutter Web
- Hébergement : Vercel
- Pipeline : GitHub → Vercel (main)
- Domaine : https://qrpruf.sanadidari.com

## 🔷 Vercel.json
{
  "builds": [
    { "src": "web/index.html", "use": "@vercel/static" }
  ],
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

## 🔷 Historique migration
- HostPapa supprimé
- Scripts PowerShell supprimés
- Watchdog supprimé
- Migration Vercel terminée

## 🔷 Points vigilance
- Tester routing Vercel Preview
- Vérifier logs en cas de page blanche

## 🔷 TODO
- SEO Flutter Web
- README pro

## 🔷 State GitHub
- Repo : sanadidari/empreinte_verif
- Branche : main
- Dernière vérification : 2025‑12‑05
- État : OK

## 🔷 Résumé des tâches
- Terminé : Migration, nettoyage, système PRO
- En cours : Configuration du déploiement Vercel
- À faire : Import Vercel, build, déploiement, mise à jour
