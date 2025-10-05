# Troubleshooting

- **Empty/verbose output** → tighten the prompt (explicit format & max tokens), keep temperature ≤ 0.3.
- **Non-JSON replies** → wrap model output in explicit instructions (“respond with bullet points only”), keep the post-processor strict.
- **Timeouts/429** → raise timeout modestly; enable retries with exponential backoff; respect `Retry-After`.
- **Language mismatches** → pass desired `lang` explicitly and validate it; avoid auto-detect unless you handle it downstream.