# ALPHA_ADVISOR_SPEC.md — Predictive Advisor (Non-Acting)

version: 1.0
role: Advisory / Predictive guidance

## Purpose
Alpha-Advisor analyzes historical incidents (RCDB), correlations and supervisor audits to:
- detect trends
- compute a risk score (0-100)
- produce human-readable recommendations
- produce a structured JSON of prioritized actions

## Guarantees
- Advisor does NOT modify code, files or workflows
- Advisor does NOT trigger deployments
- Advisor ALWAYS creates reports for human review
- Advisor runs on schedule or manual dispatch

## Outputs
- advisor_report.md (human-readable summary)
- advisor_recommendations.json (structured list)
- both available as workflow artifacts and posted to a GitHub issue

## Next improvements
- optional ML model for trend detection (must remain advisory)
- richer correlation with Sentry traces (if enabled)
