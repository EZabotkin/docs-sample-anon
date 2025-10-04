# Developer Docs Sample (Vendor-neutral)

This repository is a **vendor-neutral** docs-as-code sample for a node-based workflow/automation platform.
It combines anonymized **enterprise case-study** docs with **generic workflow-demo** content suitable for developer tools roles.

- Static site: **MkDocs Material**
- CI: build, link check (lychee), style lint (Vale)
- Content: task-first (Quickstart/How-to/Reference), mermaid diagrams, runnable snippets
- Languages: EN with a short DE overview (B2–C1)

## Structure
- `docs/workflow/` – generic demo (no brand names)
- `docs/case-studies/` – anonymized enterprise case (paste your existing content here, scrubbed)
- `docs/contributing/`, `docs/metrics.md` – process & KPI
- `.github/workflows/` – CI for docs
- `.vale.ini` and `styles/` – style checks (Vale)

## Quick start
```bash
pip install -r requirements.txt
python -m mkdocs serve
```
