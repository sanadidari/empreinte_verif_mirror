#!/usr/bin/env python3
# tools/alpha_advisor.py
# ALPHA-ADVISOR: Predictive, non-acting advisor for the autonome system.
# - Reads RCDB, correlations and supervisor report
# - Produces advisor_report.md (human readable) and advisor_recommendations.json (structured)
# - Uses simple statistical heuristics and moving-window trend detection
# - DOES NOT PERFORM ANY WRITE OR DEPLOY ACTIONS ON THE REPO

import argparse, json, math, statistics, datetime, os, re
from pathlib import Path

DEFAULT_OUTDIR = "/tmp/alpha_advisor"

def load_json(path):
    p = Path(path)
    if not p.exists():
        return {}
    try:
        return json.loads(p.read_text(encoding="utf-8"))
    except Exception:
        return {}

def read_text(path):
    p = Path(path)
    if not p.exists():
        return ""
    return p.read_text(encoding="utf-8")

def incidents_time_series(rcdb):
    """Return a simple daily-count timeseries from RCDB incidents timestamps (UTC)."""
    data = rcdb.get("incidents", [])
    dates = []
    for inc in data:
        t = inc.get("timestamp") or inc.get("time") or inc.get("date")
        if not t:
            continue
        try:
            # accept ISO-like strings
            d = datetime.datetime.fromisoformat(t.replace("Z", "+00:00")).date()
        except Exception:
            try:
                d = datetime.date.fromisoformat(t.split("T")[0])
            except Exception:
                continue
        dates.append(str(d))
    # count per day
    counts = {}
    for d in dates:
        counts[d] = counts.get(d, 0) + 1
    # convert to sorted list of (date, count)
    series = sorted(counts.items())
    return series

def moving_average(series, window=3):
    values = [v for _,v in series]
    ma = []
    for i in range(len(values)):
        start = max(0, i-window+1)
        window_vals = values[start:i+1]
        ma.append(sum(window_vals)/len(window_vals))
    return ma

def detect_trend(series):
    """Return 'increasing', 'decreasing', or 'stable' based on linear fit slope heuristic."""
    if len(series) < 3:
        return "stable"
    xs = list(range(len(series)))
    ys = [v for _,v in series]
    n = len(xs)
    mean_x = statistics.mean(xs)
    mean_y = statistics.mean(ys)
    num = sum((xs[i]-mean_x)*(ys[i]-mean_y) for i in range(n))
    den = sum((xs[i]-mean_x)**2 for i in range(n)) or 1
    slope = num/den
    # normalize slope
    if slope > 0.2:
        return "increasing"
    if slope < -0.2:
        return "decreasing"
    return "stable"

def risk_score(rcdb, corr, supervisor_text):
    """Compute a compact risk score 0-100"""
    incidents = rcdb.get("incidents", [])
    incident_count = len(incidents)
    biggest_cluster = 0
    if corr and "clusters" in corr and len(corr["clusters"])>0:
        biggest_cluster = corr["clusters"][0].get("count", 0)
    supervisor_flags = 0
    if supervisor_text:
        supervisor_flags += int(bool(re.search(r"loop|repeat|repeated|failure|failed|unstable", supervisor_text, re.IGNORECASE)))
    score = 100
    score -= min(incident_count * 1.0, 40)
    score -= min(biggest_cluster * 2.0, 40)
    score -= supervisor_flags * 10
    return max(0, min(100, int(score)))

def synthesize_recommendations(rcdb, corr, supervisor_text):
    recs = []
    # 1) If biggest cluster high and repeated -> recommend focused patch + deep Sentry
    if corr and "clusters" in corr and len(corr["clusters"])>0:
        top = corr["clusters"][0]
        if top.get("count",0) >= 5:
            recs.append({
                "type":"urgent_cluster_investigation",
                "priority":"high",
                "reason": f"Cluster '{top.get('signature')}' occurs {top.get('count')} times. Suggest human review and run Auto-Heal templates targeting cluster keywords.",
                "suggested_actions": [
                    "Open focused RCA task for cluster",
                    "Run Auto-Heal in dry-run locally",
                    "Increase Sentry sampling for affected endpoints"
                ]
            })
    # 2) If supervisor reports loops
    if supervisor_text and re.search(r"loop|infinite|repeated", supervisor_text, re.IGNORECASE):
        recs.append({
            "type":"agent_loop_mitigation",
            "priority":"high",
            "reason":"Supervisor detected potential agent loop. Recommend freezing Auto-Apply and Workflow Rewriter until manual audit.",
            "suggested_actions":["Governor: apply freeze on conflicting agents","Manual audit of last 10 incidents"]
        })
    # 3) Trend recommendations
    series = incidents_time_series(rcdb)
    trend = detect_trend(series)
    if trend == "increasing":
        recs.append({
            "type":"trend_alert",
            "priority":"medium",
            "reason":"Incident counts show an increasing trend",
            "suggested_actions":["Increase monitoring frequency","Run targeted tests on recently changed modules"]
        })
    elif trend == "stable":
        recs.append({
            "type":"trend_ok",
            "priority":"low",
            "reason":"Incident rate stable",
            "suggested_actions":["Maintain current policies","Periodic review"]
        })
    # 4) Release & performance
    # If many clusters mention 'main.dart.js' or 'size', advise to check bundle size
    if corr and "clusters" in corr:
        for c in corr["clusters"][:3]:
            kws = " ".join(c.get("top_keywords",[])).lower()
            if "main.dart" in kws or "size" in kws or "bundle" in kws:
                recs.append({
                    "type":"bundle_size_check",
                    "priority":"medium",
                    "reason":"Bundle-related keywords found in correlations",
                    "suggested_actions":["Analyze build/web/main.dart.js size", "Consider code-splitting or deferred loading"]
                })
                break
    return recs

def build_report(rcdb, corr, supervisor_text, outdir):
    ts = incidents_time_series(rcdb)
    ma = moving_average(ts, window=3)
    trend = detect_trend(ts)
    score = risk_score(rcdb, corr, supervisor_text)
    recs = synthesize_recommendations(rcdb, corr, supervisor_text)

    now = datetime.datetime.datetime.utcnow().isoformat() if hasattr(datetime, "datetime") else datetime.datetime.utcnow().isoformat()
    header = f"# ALPHA-ADVISOR REPORT\nGenerated: {now} UTC\n\n"
    meta = f"- incidents_total: {len(rcdb.get('incidents',[]))}\n- top_cluster_count: { (corr.get('clusters',[])[0].get('count',0) if corr and corr.get('clusters') else 0) }\n- trend: {trend}\n- risk_score: {score}\n\n"

    body = "## Trend (last days)\n"
    for d,c in ts[-10:]:
        body += f"- {d}: {c}\n"
    body += "\n## Moving average (window=3)\n"
    body += ", ".join([str(round(x,2)) for x in ma[-10:]]) + "\n\n"

    body += "## Recommendations\n"
    if not recs:
        body += "- No immediate actions recommended. Continue monitoring.\n"
    else:
        for r in recs:
            body += f"- [{r['priority'].upper()}] {r['reason']}\n"
            for s in r.get("suggested_actions",[]):
                body += f"  - {s}\n"
    body += "\n## Notes\n- ALPHA-ADVISOR is advisory only: it will not change repository files or trigger workflows.\n"

    # write files
    Path(outdir).mkdir(parents=True, exist_ok=True)
    report_md = Path(outdir) / "advisor_report.md"
    report_json = Path(outdir) / "advisor_recommendations.json"

    report_md.write_text(header + meta + body, encoding="utf-8")
    report_json.write_text(json.dumps({"risk_score":score,"trend":trend,"recommendations":recs}, indent=2), encoding="utf-8")

    return str(report_md), str(report_json)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--rcdb", required=True)
    parser.add_argument("--corr", required=True)
    parser.add_argument("--supervisor", required=True)
    parser.add_argument("--outdir", default=DEFAULT_OUTDIR)
    args = parser.parse_args()

    rcdb = load_json(args.rcdb)
    corr = load_json(args.corr)
    supervisor_text = read_text(args.supervisor)

    report_path, json_path = build_report(rcdb, corr, supervisor_text, args.outdir)
    print("Advisor outputs:", report_path, json_path)

if __name__ == "__main__":
    main()
