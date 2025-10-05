# Prepare input (Code node)

Here is a tiny example of a prepared input.

Keep inputs short, predictable, and language-aware.

```javascript
// Trim long inputs and set safe defaults.
// Always return an array of items.
return [{
  json: {
    text: String($json?.text ?? '').slice(0, 2000), // cap length
    lang: ($json?.lang ?? 'en').toLowerCase(),
    task: $json?.task ?? 'summarize',               // summarize | rewrite | extract
    audience: $json?.audience ?? 'developer'
  }
}];
```

!!! info "Why:" 
    Capping length reduces cost/latency and prevents token overruns.