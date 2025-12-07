#!/usr/bin/env python3
# tools/omega_engine.py
# OMEGA MODE — Autonomous Evolution & Optimization Engine

import json, datetime, subprocess, os, re
from pathlib import Path

def load(path, fallback=None):
    if Path(path).exists():
        return json.load(open(path, "r", encoding="utf-8"))
    return fallback

def write(path, data):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)

def read_text(path):
    if Path(path).exists():
        return Path(path).read_text()
    return ""

def write_text(path, content):
    Path(path).write_text(content, encoding="utf-8")

def run(cmd):
    print("+", cmd)
    out = subprocess.run(cmd, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return out.stdout.strip(), out.stderr.strip(), out.returncode

def semantic_bump(version, change_type):
    major, minor, patch = map(int, version.split("."))
    if change_type == "major":
        major += 1; minor = 0; patch = 0
    elif change_type == "minor":
        minor += 1; patch = 0
    else:
        patch += 1
    return f"{major}.{minor}.{patch}"

def omega_decide_action(rcdb, corr, sup, gov):
    # Respecte les ordres du gouverneur.
    if gov and "actions" in gov:
        for a in gov["actions"]:
            if a["type"] == "freeze" and a["target"] == "OMEGA":
                return "idle"

    # Analyse incidents → optimisation
    if corr and corr.get("clusters"):
        if corr["clusters"][0]["count"] >= 5:
            return "refactor_code"

    # Analyse supervisor → performances
    if "slow" in sup.lower():
        return "optimize_web"

    # Système stable → version bump
    return "release_cycle"

def omega_refactor_code():
    # Réécriture automatique (safe) des patterns classiques
    for dart_file in Path("lib").glob("**/*.dart"):
        content = dart_file.read_text()

        # Simplification de patterns connus
        new = re.sub(r"new\s+([A-Za-z]+)\(", r"\1(", content)
        new = re.sub(r"const\s+new", "const", new)

        if new != content:
            dart_file.write_text(new, encoding="utf-8")

    run("dart format lib")
    return "refactor_complete"

def omega_optimize_web():
    run("flutter build web --release || true")
    return "web_optimization_attempted"

def omega_release_cycle(state, version_path, changelog_path):
    version = "1.0.0"
    if Path(version_path).exists():
        version = Path(version_path).read_text().strip()

    new_version = semantic_bump(version, "patch")

    write_text(version_path, new_version)

    timestamp = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")
    notes = f"- Auto release {new_version} — {timestamp}\n"
    Path(changelog_path).write_text(notes, encoding="utf-8")

    return f"released:{new_version}"

def main():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("--state", required=True)
    p.add_argument("--version", required=True)
    p.add_argument("--changelog", required=True)
    p.add_argument("--rcdb", required=True)
    p.add_argument("--corr", required=True)
    p.add_argument("--sup", required=True)
    p.add_argument("--gov", required=True)
    args = p.parse_args()

    rcdb = load(args.rcdb, {})
    corr = load(args.corr, {})
    sup = read_text(args.sup)
    gov = load(args.gov, {})

    state = load(args.state, {"history": []})

    action = omega_decide_action(rcdb, corr, sup, gov)

    if action == "refactor_code":
        result = omega_refactor_code()
    elif action == "optimize_web":
        result = omega_optimize_web()
    elif action == "release_cycle":
        result = omega_release_cycle(state, args.version, args.changelog)
    else:
        result = "idle"

    state["last_action"] = action
    state["last_result"] = result
    state["last_run"] = datetime.datetime.utcnow().isoformat()
    state["history"].append({
        "time": state["last_run"],
        "action": action,
        "result": result
    })

    write(args.state, state)
    print("OMEGA cycle:", action, result)

if __name__ == "__main__":
    main()
