# NEXT_ACTION.md — PROTOCOL TASK ORDER (PTO-1)
version: 1.1
status: BLOCKING
action_id: FLUTTER_WEB_PIPELINE_VERIFICATION
priority: TOP
agent_visibility: PUBLIC
execution_mode: STRICT_STEP_BY_STEP

## NEXT_ACTION
VÉRIFIER ET EXÉCUTER LE PIPELINE FLUTTER WEB ? VERCEL

## OBJECTIVE
Assurer que la chaîne fonctionne :
GitHub ? workflow build_web.yml ? build/web ? Vercel ? domaine qrpruf.sanadidari.com

## PREREQUIS.GITHUB
- build_web.yml présent et valide
- secret VERCEL_TOKEN présent
- secret MIRROR_DEPLOY_KEY présent
- commande flutter build web --release

## PREREQUIS.FLUTTER_WEB
- index.html
- flutter_bootstrap.js
- assets/, icons/, manifest.json
- base-href correct

## PREREQUIS.VERCEL
- domaine configuré
- SSL actif
- CNAME actif

## EXECUTION_STEPS
1. Vérifier workflow build_web.yml
2. Dry-run build Flutter Web
3. Commit minimal pour déclencher Actions
4. Analyse logs Vercel
5. Vérifier :
   - https://qrpruf.sanadidari.com
   - https://www.qrpruf.sanadidari.com
6. Mettre à jour STATE_PROJECT, TASKS, HISTORY

## DONE_CRITERIA
- Build OK
- Déploiement OK
- Site fonctionne sans page blanche
- Pas d'erreur console
- Domaine OK

## AFTER_DONE
User must define next action.
