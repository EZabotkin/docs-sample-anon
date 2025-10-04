# HTTP Client Node – Cheatsheet

## Quickstart
- **Method:** GET/POST
- **URL:** Target endpoint (e.g., `https://httpbin.org/post`)
- **Auth:** None/Bearer/API Key as needed
- **Body:** `{{$json}}` to forward prior node output

## Retry & Limits
- Enable retries on 429/5xx.
- Respect rate limits (backoff, `Retry-After`).

## Error Matrix (Examples)
| Code | Cause                  | Action                      |
|-----:|------------------------|-----------------------------|
| 400  | Invalid payload        | Validate/adjust body        |
| 401  | Missing/expired token  | Refresh/attach auth         |
| 429  | Rate limit             | Retry with backoff          |
| 5xx  | Server error           | Retry, alert, fallback      |
