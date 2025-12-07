#!/usr/bin/env python3
# tools/workflow_rewriter.py
# AWR Engine: rewrites GitHub workflows based on RCDB, correlations, and supervisor report.

import os, json, re, yaml, datetime
from pathlib import Path

def load_json(path):
    if Path(path).exists():
        return json.load(open(path, "r", encoding="utf-8"))
    return {}

def load_workflows(folder):
    workflows = []
    for f in Path(folder).glob("*.yml"):
        workflows.append((f, yaml.safe_load(open(f, "r", encoding="utf-8"))))
    return workflows

def detect_problems(wf_name, wf):
    issues = []
    # Examples of detection logic:
    if "steps" not in str(wf):
        issues.append("Workflow missing steps definition")

    wf_text = str(wf).lower()

    if "actions/checkout" not in wf_text:
        issues.append("checkout step missing")

    if "runs-on" not in wf_text:
        issues.append("runs-on missing")

    if "timeout-minutes" not in wf_text:
        issues.append("timeout missing")

    # Detect outdated versions
    if "actions/checkout@v1" in wf_text or "actions/checkout@v2" in wf_text:
        issues.append("checkout version outdated")

    if "node-version: '12'" in wf_text:
        issues.append("Node 12 deprecated")

    return issues

def rewrite_workflow(wf_name, wf, issues):
    """Rewrite workflow into corrected modern format."""
    new = wf.copy()

    # Ensure checkout v4
    text = yaml.safe_dump(new)
    text = re.sub(r"actions/checkout@v[0-9]+", "actions/checkout@v4", text)

    # Ensure timeout exists
    if "timeout-minutes" not in text:
        text = text.replace("runs-on:", "timeout-minutes: 20\n  runs-on:")

    # Force newer ubuntu version
    text = text.replace("ubuntu-latest", "ubuntu-22.04")

    # Ensure setup-python upgrade
    if "setup-python" in text:
        text = re.sub(r"python-version: ['\"]?3\.[0-9]+['\"]?", "python-version: '3.11'", text)

    return text

def main():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("--workflows", required=True)
    p.add_argument("--rcdb", required=True)
    p.add_argument("--corr", required=True)
    p.add_argument("--report", required=True)
    p.add_argument("--out", required=True)
    args = p.parse_args()

    os.makedirs(args.out, exist_ok=True)

    rcdb = load_json(args.rcdb)
    corr = load_json(args.corr)

    workflows = load_workflows(args.workflows)
    print(f"Loaded {len(workflows)} workflows")

    for path, wf in workflows:
        name = path.name
        issues = detect_problems(name, wf)

        if not issues:
            continue  # workflow is fine

        print(f"Rewriting workflow: {name}, issues: {issues}")

        rewritten = rewrite_workflow(name, wf, issues)
        out_path = Path(args.out) / name

        with open(out_path, "w", encoding="utf-8") as f:
            f.write(rewritten)

    print("Rewrite complete.")

if __name__ == "__main__":
    main()
