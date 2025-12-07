#!/usr/bin/env python3
# tools/self_supervisor.py
# High-level autonomous auditor scanning system behavior, agents, workflows, patterns.

import json, os, datetime
from pathlib import Path

def load_json(path):
    if Path(path).exists():
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    return {}

def detect_repeated_failures(incidents):
    fails = {}
    for inc in incidents:
        if inc.get("conclusion") != "failure":
            continue
        wf = inc.get("workflow", "unknown")
        fails.setdefault(wf, 0)
        fails[wf] += 1
    return {k:v for k,v in fails.items() if v >= 3}

def detect_agent_loops(incidents):
    loops = []
    workflows = [inc.get("workflow") for inc in incidents]
    for wf in set(workflows):
        seq = [i for i in incidents if i.get("workflow") == wf]
        if len(seq) >= 4 and all(i.get("conclusion") == "failure" for i in seq[-4:]):
            loops.append(wf)
    return loops

def generate_report(rcdb, corr):
    incidents = rcdb.get("incidents", [])
    repeated = detect_repeated_failures(incidents)
    loops = detect_agent_loops(incidents)

    clusters = corr.get("clusters", [])
    top_cluster = clusters[0] if clusters else None

    now = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")

    report = f"""
# SUPERVISOR_REPORT.md — Autonomous System Audit
Generated: {now}

## 1. System Status Summary
Total incidents recorded: {len(incidents)}
Clusters identified: {len(clusters)}

## 2. Repeated Workflow Failures (>=3)
{json.dumps(repeated, indent=2)}

## 3. Agents Detected in Potential Loop
{json.dumps(loops, indent=2)}

## 4. Most Significant Current Cluster
{json.dumps(top_cluster, indent=2)}

## 5. Supervisor Recommendations
- If repeated failures exist → review workflow or apply patch templates.
- If loops detected → temporarily disable offending workflow.
- Keep patches folder updated.
- Verify NEXT_ACTION.md progression.
"""

    return report

def main():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("--rcdb", required=True)
    p.add_argument("--corr", required=True)
    p.add_argument("--out", required=True)
    args = p.parse_args()

    rcdb = load_json(args.rcdb)
    corr = load_json(args.corr)

    report = generate_report(rcdb, corr)

    with open(args.out, "w", encoding="utf-8") as f:
        f.write(report)

    print("Supervisor report written to", args.out)

if __name__ == "__main__":
    main()
