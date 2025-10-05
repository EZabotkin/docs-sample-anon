# Metrics we watch


Track outcomes to keep the feature honest:

- **Latency (p50/p95)** of the AI call (ms)
- **Validity rate** (well-formed JSON / expected keys)
- **Cost per 1k tokens** (estimated vs. actual)
- **Deflection** (docs page with AI snippet reduces related tickets)
- **TTFW** (Time to First Workflow): Time from landing to a working workflow
- **TTFC** (Time to First Call): Time to first successful API call

    !!! note "Note"
        **TTFC/TTFW** impact when AI-augmented content is present

- **Top Errors:** Most frequent 4xx/5xx with root causes and fixes
- **Search → No Result:** Queries without hits

_Collect via site search logs, issue labels (e.g., `docs-bug`), and analytics events._
