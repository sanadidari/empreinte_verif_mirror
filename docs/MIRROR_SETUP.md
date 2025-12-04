🔁 GitHub Mirror System — Setup & Maintenance Guide
📌 1. Overview

This document explains how the automatic mirroring system works between:

Private repo → sanadidari/empreinte_verif

Public mirror repo → sanadidari/empreinte_verif_mirror

Each push to the main branch triggers a GitHub Action that mirrors your code to the public repo.

📌 2. Current System Status
Component	Status
SSH private key generated	✔ OK
SSH public key added as Deploy Key	✔ OK (write access required)
Secret MIRROR_DEPLOY_KEY created	⚠ Must be checked (format issue possible)
Workflow .github/workflows/mirror.yml	✔ Installed
Workflow execution	❌ Fails due to missing key input (secret not read)
Automatic mirroring	⬜ Pending fix
📌 3. TODO LIST — Steps to Complete
🔧 Step 1 — Confirm Deploy Key in Public Repo

Location: empreinte_verif_mirror → Settings → Deploy Keys

Ensure the key is present

Enable “Allow write access”

🔧 Step 2 — Fix the Secret MIRROR_DEPLOY_KEY

Location: empreinte_verif → Settings → Secrets → Actions

Checklist:

Name must be exactly: MIRROR_DEPLOY_KEY

Paste the private key with no extra spaces or blank lines

It must follow this exact structure:

-----BEGIN OPENSSH PRIVATE KEY-----
...
-----END OPENSSH PRIVATE KEY-----

Common mistakes to avoid:

Blank line before BEGIN

Blank line after END

Extra spaces at left/right

Missing lines inside the key

🔧 Step 3 — Validate the mirror.yml Workflow File

Path:

/.github/workflows/mirror.yml

Correct full content:

name: Mirror to Public Repo


on:
  push:
    branches: [ "main" ]


jobs:
  mirror:
    runs-on: ubuntu-latest


    steps:
      - name: Checkout source repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0


      - name: Install SSH key
        uses: shimataro/ssh-key-action@v2
        with:
          key: ${{ secrets.MIRROR_DEPLOY_KEY }}
          known_hosts: github.com


      - name: Add mirror remote
        run: |
          git remote add mirror git@github.com:sanadidari/empreinte_verif_mirror.git


      - name: Force push to mirror
        run: |
          git push --force mirror main

Important:

Indentation must be 2 spaces

The line key: ${{ secrets.MIRROR_DEPLOY_KEY }} must match the secret name exactly

🔧 Step 4 — Manual Trigger Test

After fixing the secret:

Edit any file (e.g., README.md)

Commit the change

GitHub Actions → Watch the workflow run

Expected result:

🟢 Success → mirroring works

🔴 Failure: key required → secret still misformatted

📌 4. Troubleshooting
❌ Error: Input required and not supplied: key

Causes:

Secret not saved

Formatting incorrect

Extra blank line

YAML referencing wrong secret name

Solution: Re‑paste the private key exactly with no modifications.

📌 5. When Everything Works

Once green:

Every push to main instantly updates the public repo

No local action required

Fully automated deployment ✓

📌 6. Future Enhancements (optional)

Add scheduled nightly sync (cron)

Add protection logic (ignore deleted branches)

Enable Discord/email notifications

📌 7. Last Updated

04 Dec 2025 — ChatGPT PRO Session