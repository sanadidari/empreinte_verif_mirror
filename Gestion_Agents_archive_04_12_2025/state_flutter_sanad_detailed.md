# STATE PROJECT — SANAD IDARI

Ce fichier représente l’état actuel du projet.  
Il doit être mis à jour par chaque agent lorsqu’une modification structurelle est faite.

---

## 🔷 Stack technique
- Flutter Web
- Hébergement : **Vercel**
- Déploiement : **GitHub ➜ Vercel**, branch `main`
- Domaine final : **https://qrpruf.sanadidari.com**

---

## 🔷 Fichier `vercel.json` ACTUEL

{
  "builds": [
    {
      "src": "web/index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

---

## 🔷 Historique de migration
- Ancien déploiement FTP HostPapa → **supprimé**
- Script PowerShell deploy.ps1 → **supprimé**
- Watchdog Windows au démarrage → **supprimé**
- Migration totale vers Vercel → **terminée**

---

## 🔷 Points de vigilance
- Vercel doit servir **web/** comme racine.
- Toute modification du routing doit être testée sur Vercel Preview.
- Toujours vérifier `Deployments → Logs` si page blanche.

---

## 🔷 TODO futurs
- Optimiser SEO Flutter Web
- Ajouter un README pro au repo GitHub

---

## 🔷 State GitHub (NOUVEAU)
- Dépôt : sanadidari/empreinte_verif
- Branche active : `main`
- Dernière vérification : 2025-12-05
- État : OK
