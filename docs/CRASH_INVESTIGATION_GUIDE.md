# CRASH_INVESTIGATION_GUIDE.md

This guide explains the AI Crash Investigator system.

## Purpose
- Automatically analyze artifacts and logs from failed workflows.
- Produce a human-readable summary and a JSON report.
- Create a GitHub issue when a failure occurs, attaching investigation artifacts.

## Files produced
- tools/ai_crash_investigator.py
- artifacts uploaded by workflow: ai-crash-investigation (contains investigation_summary.md, investigation_report.json, collected logs)

## How it works
- Triggered on completed runs of major workflows or via manual dispatch.
- Downloads available artifacts for the triggering run.
- Scans known files for error keywords and missing files.
- Produces: investigation_summary.md (human-readable) and investigation_report.json (structured).
- Creates GitHub issue if the triggering run status != success.

## Next steps
- Optionally integrate with Sentry for deeper stack trace grouping.
- Extend the Python analyzer with ML models or pattern DB for better RCA.
