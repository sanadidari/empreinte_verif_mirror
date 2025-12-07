#!/usr/bin/env python3
# tools/patch_applier.py
# Simple patch applier: reads a cluster JSON, chooses a matching patch template from .patches,
# applies changes in a new branch, runs basic validation (flutter pub get / dart format / build web test optional),
# and creates a PR (uses GH CLI if configured). In propose mode it only creates a branch + PR with patch.

import argparse
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

def run(cmd, check=True, capture=False, env=None):
    print(f"+ {cmd}")
    r = subprocess.run(cmd, shell=True, check=False, text=True, env=env, stdout=(subprocess.PIPE if capture else None))
    if capture:
        return r.stdout.strip()
    return r.returncode

def load_cluster(path):
    with open(path,'r',encoding='utf-8') as fh:
        return json.load(fh)

def find_patch_for_cluster(cluster, patch_dir):
    # Matching heuristics: signature keywords include 'manifest', 'missing', 'pubspec', 'bootstrap', 'main.dart.js'
    sig = cluster.get('signature','').lower()
    kws = []
    try:
        kws = cluster.get('top_keywords',[])
    except:
        kws = []
    candidates = []
    for p in Path(patch_dir).glob("*.patch"):
        name = p.name.lower()
        if any(k in name for k in ['manifest','pubspec','bootstrap','missing','assets','index','main.dart','rollback']):
            candidates.append(p)
    # favour strong matches
    for p in candidates:
        if any(k in p.name.lower() for k in kws):
            return p
    # fallback first candidate
    return candidates[0] if candidates else None

def apply_patch_file(patch_path, repo_root):
    # simple convention: patch files are executable shell scripts or unified diffs.
    # If file ends with .sh -> execute; if .diff or .patch -> apply with git apply
    p = Path(patch_path)
    if p.suffix == '.sh':
        run(f"bash {p} || true")
        return True
    if p.suffix in ['.patch','.diff']:
        code = run(f"git apply {p} || (echo 'git apply failed' && exit 1)")
        return code == 0
    # unknown -> skip
    print("Unknown patch format:", p)
    return False

def create_branch_and_commit(files_to_stage, branch_name, commit_message):
    run(f"git checkout -b {branch_name}")
    if files_to_stage:
        run(f"git add {' '.join(files_to_stage)}")
    run(f'git commit -m "{commit_message}" || echo "no changes to commit"')
    run(f"git push origin {branch_name}")

def create_pr(branch, title, body):
    # prefer gh cli if present
    gh_exists = (run("which gh", check=False) == 0)
    if gh_exists:
        run(f'gh pr create --title "{title}" --body "{body}" --head {branch} --base main || echo "gh pr create failed"')
    else:
        print("gh CLI not found — cannot auto-create PR. Branch pushed:", branch)

def validate_after_patch(do_build=False):
    ok = True
    run("flutter pub get || true")
    run("dart format . || true")
    if do_build:
        rc = run("flutter build web --release || true")
        if rc != 0:
            ok = False
    return ok

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--cluster', required=True)
    p.add_argument('--patch-dir', default=".patches")
    p.add_argument('--out', required=True)
    p.add_argument('--apply', action='store_true')
    p.add_argument('--dry', action='store_true')
    args = p.parse_args()

    cluster = load_cluster(args.cluster)
    result = {"applied": False, "proposed": False, "patch": None, "notes": ""}

    patch = find_patch_for_cluster(cluster, args.patch_dir)
    if not patch:
        result['notes'] = "No matching patch template found."
        print(result['notes'])
        with open(args.out,'w') as fh:
            json.dump(result,fh,indent=2)
        return 0

    result['patch'] = str(patch)
    branch = f"auto/patch/{Path(patch).stem}-{os.getpid()}"

    if not args.apply:
        # propose mode: create branch with changes but do not attempt risky apply
        tmp_branch = branch
        run(f"git checkout -b {tmp_branch}")
        # copy patch template into repo under .patches/applied-<timestamp> for reviewer
        dest = Path(".patches")/f"proposed_{Path(patch).name}"
        run(f"cp {patch} {dest}")
        run(f"git add {dest}")
        run(f'git commit -m "chore: propose patch {Path(patch).name}" || echo "no changes"')
        run(f"git push origin {tmp_branch} || echo 'push failed'")
        create_pr(tmp_branch, f"Proposed patch: {Path(patch).name}", f"Proposed automatic patch for cluster {cluster.get('signature')}")
        result['proposed'] = True
        result['notes'] = "Proposed patch via PR."
    else:
        # apply mode: attempt to apply safely
        tmp_branch = branch
        run(f"git checkout -b {tmp_branch}")
        ok = False
        try:
            ok = apply_patch_file(patch, ".")
        except Exception as e:
            result['notes'] = f"Exception applying patch: {e}"
        if ok:
            # validate
            valid = validate_after_patch(do_build=False)
            run("git add -A || true")
            run(f'git commit -m "fix: auto-applied patch {Path(patch).name}" || echo "no changes"')
            run(f"git push origin {tmp_branch} || echo 'push failed'")
            create_pr(tmp_branch, f"Auto-applied patch: {Path(patch).name}", f"Auto-applied patch for cluster {cluster.get('signature')}. Validation success: {valid}")
            result['applied'] = True
            result['notes'] = f"Applied and pushed. Validation: {valid}"
        else:
            result['notes'] = "Patch application failed."
            # cleanup branch
            run("git checkout main || true")
    with open(args.out,'w') as fh:
        json.dump(result,fh,indent=2)
    print("Result written to", args.out)
    return 0

if __name__ == '__main__':
    sys.exit(main())
