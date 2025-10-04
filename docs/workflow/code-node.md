# Code Node (JavaScript) – Basics

## Input/Output
- **Input:** `items[]` with `json` fields.
- **Output:** Return an array of transformed `items`.

## Examples

**Map/Transform**

```javascript
return items.map((item) => ({
  json: {
    upper: String(item.json.text || '').toUpperCase(),
    ts: Date.now()
  }
}));
```

**Error Handling**

```javascript
try {
  const value = item.json.value;
  if (value == null) throw new Error('value is required');
  return [{ json: { ok: true, value } }];
} catch (e) {
  return [{ json: { ok: false, error: e.message } }];
}
```

## Best Practices
- Keep functions small and testable.
- Validate input before external calls.
- Structure errors (`ok`, `error`).
