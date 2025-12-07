#!/usr/bin/env python3
# tools/ai_crash_investigator.py
# Simple rule-based crash investigator that scans collected log files and artifacts,
# extracts error keywords, sizes, missing files, and produces a JSON report + a Markdown summary.

import os
import sys
import argparse
import json
import re
from pathlib import Path

ERROR_KEYWORDS = re.compile(r'error|exception|fail|panic|traceback|segfault|cannot|get|404', re.IGNORECASE)

def collect_files(input_dir):
    files = []
    for root, _, filenames in os.walk(input_dir):
        for fn in filenames:
            path = os.path.join(root, fn)
            files.append(path)
    return files

def scan_file(path):
    try:
        text = open(path, 'r', errors='ignore').read()
    except Exception:
        return {'path': path, 'error': 'cannot_read'}
    findings = []
    for m in ERROR_KEYWORDS.finditer(text):
        context = text[max(0, m.start()-80):m.end()+80].replace('\n',' ')
        findings.append({'keyword': m.group(0), 'context': context[:300]})
    size = os.path.getsize(path)
    return {'path': path, 'size': size, 'findings': findings}

def summarize(findings):
    total_errors = sum(1 for f in findings for _ in f.get('findings',[]))
    summary_lines = []
    summary_lines.append(f"Total files scanned: {len(findings)}")
    summary_lines.append(f"Total error keywords found: {total_errors}")
    if total_errors == 0:
        summary_lines.append("No obvious error keywords found — recommend deeper analysis (Sentry / logs).")
    else:
        summary_lines.append("Top findings (sample contexts):")
        for f in findings:
            if f.get('findings'):
                for item in f['findings'][:2]:
                    summary_lines.append(f"- {Path(f['path']).name}: ...{item['context']}...")
    return "\n".join(summary_lines)

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--input-dir', required=True)
    p.add_argument('--out', required=True)
    p.add_argument('--summary', required=True)
    args = p.parse_args()

    input_dir = args.input_dir
    files = collect_files(input_dir)
    results = []
    for f in files:
        # only process small-to-medium text files and known patterns
        if os.path.getsize(f) > 50*1024*1024:
            continue
        results.append(scan_file(f))

    report = {
        'meta': {
            'input_dir': input_dir,
            'files_scanned': len(results)
        },
        'files': results
    }

    with open(args.out, 'w') as fh:
        json.dump(report, fh, indent=2)

    summary_text = summarize(results)
    with open(args.summary, 'w') as fh:
        fh.write("# AI Crash Investigator — Summary\n\n")
        fh.write(summary_text)
        fh.write("\n\n---\n\n")
        fh.write("Files scanned:\n")
        for r in results:
            fh.write(f"- {r['path']} (size: {r.get('size')})\n")

    print("Investigation complete.")
    return 0

if __name__ == '__main__':
    sys.exit(main())
