# Post-process & guardrails (Code node)

Normalize the model’s output into a shape the rest of the flow can rely on.

```javascript
function toBullets(s) {
  return String(s || '')
    .split(/\n+/)
    .map(x => x.replace(/^[-*]\s*/, '').trim())
    .filter(Boolean);
}

function clampLen(arr, n) { return arr.slice(0, n); }

const out = $json?.summary ?? $json?.result ?? $json?.text ?? '';
const bullets = clampLen(toBullets(out), 10);

return [{
  json: {
    ok: bullets.length > 0,
    bullets,
    lang: $json?.lang ?? 'en',
    meta: {
      // Optionally pass through provider metadata for observability
      tokens_in: $json?.tokens_in ?? null,
      tokens_out: $json?.tokens_out ?? null,
      latency_ms: $json?.latency_ms ?? null
    }
  }
}];
```

!!! info "Why:" 
    Defensive parsing prevents downstream failures when the model replies with free text.