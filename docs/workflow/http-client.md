# Call the model (HTTP client)

Here is a tiny example of an HTTP client node.

Send a compact, explicit JSON contract. Keep **temperature** low for reproducibility.

```json
{
  "task": "summarize",
  "audience": "developer",
  "format": "bullet_points",
  "language": "en",
  "constraints": {
    "max_tokens": 200,
    "no_pi": true,
    "style": "concise, actionable"
  },
  "input": "{{ $json.text }}"
}
```

**HTTP tips**

* **Timeout:** 15–30s depending on the provider.
* **Retries:** enable for transient 429/5xx; honor `Retry-After`.
* **Idempotency:** pass a stable operation key when supported.
