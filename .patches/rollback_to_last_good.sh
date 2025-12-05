#!/usr/bin/env bash
set -e
if [ -f docs/ROOT_CAUSE_DB.json ]; then
  COMMIT=$(jq -r '.incidents[] | select(.conclusion=="success") | .commit' docs/ROOT_CAUSE_DB.json | head -n1)
fi
if [ -z "$COMMIT" ]; then
  echo "No last good commit found."
  exit 1
fi
BR="auto/rollback-to-${COMMIT}"
git checkout -b $BR
git revert --no-edit $COMMIT || true
git push origin $BR
if which gh > /dev/null 2>&1; then
  gh pr create --title "Auto rollback to $COMMIT" --body "Automated rollback prepared." --head $BR --base main || true
fi
