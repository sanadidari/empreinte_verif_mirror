#!/usr/bin/env python3
# tools/agent_governor.py
# Agent Governor: global control plane for all autonomous agents.

import json, datetime
from pathlib import Path

def load_json(path):
    if Path(path).exists():
        return json.load(open(path, "r", encoding="utf-8"))
    return {}

def compute_stability(rcdb, corr):
    incidents = rcdb.get("incidents", [])
    fail_count = sum(1 for i in incidents if i.get("conclusion") == "failure")
    clusters = corr.get("clusters", [])
    biggest_cluster = clusters[0]["count"] if clusters else 0

    stability = 100

    # penalties
    stability -= fail_count * 0.5
    stability -= biggest_cluster * 2

    return max(0, min(100, int(stability)))

def detect_conflicts():
    # In this version, simple rules:
    # Auto-Heal and Workflow Rewriter should NOT run simultaneously.
    return [
        {"agents": ["Auto-Heal Engine", "Workflow Rewriter"], "status": "conflict", "reason": "parallel modification risk"}
    ]

def generate_orders(stability, conflicts):
    orders = {
        "generated": datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC"),
        "stability_score": stability,
        "conflicts": conflicts,
        "actions": []
    }

    # If stability drops too low, freeze all auto-apply engines
    if stability < 40:
        orders["actions"].append({"type": "freeze", "target": "Auto-Apply Engine"})

    # If conflict detected → temporary block the Workflow Rewriter
    if conflicts:
        orders["actions"].append({
            "type": "freeze",
            "target": "Workflow Rewriter",
            "reason": "conflict detected"
        })

    # If system is very stable → allow merge acceleration
    if stability > 85:
        orders["actions"].append({"type": "accelerate", "target": "Auto-Merge Engine"})

    return orders

def main():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("--rcdb", required=True)
    p.add_argument("--corr", required=True)
    p.add_argument("--report", required=True)
    p.add_argument("--out", required=True)
    args = p.parse_args()

    rcdb = load_json(args.rcdb)
    corr = load_json(args.corr)

    stability = compute_stability(rcdb, corr)
    conflicts = detect_conflicts()
    orders = generate_orders(stability, conflicts)

    with open(args.out, "w", encoding="utf-8") as f:
        json.dump(orders, f, indent=2)

    print("Governor orders generated:", args.out)

if __name__ == "__main__":
    main()
