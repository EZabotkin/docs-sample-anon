---
version: 1.0.0
last_updated: 2025-09-14
author: Evgenii Zabotkin
---

# Getting Started: Authenticate and Make Your First API Requests

## General

This API uses **Bearer tokens (JWT)**. Send your token in the `Authorization` header.

## Prerequisites

### Authentication

To authenticate, obtain an authentication token from your auth system.

Your authentication token should look like `eyJhbGciOi...` (no quotes, no `Bearer` prefix).

### Setting Base URL and Token

Use the following commands to set your base URL and token as environment variables:

**macOS/Linux**

```bash
export API_BASE="https://api.example.com"
export TOKEN="eyJhbGciOi..."
```

**Windows**

```powershell
$env:API_BASE = "https://api.example.com"
$env:TOKEN    = "eyJhbGciOi..."
```

Now you are ready to make your first requests!

## Making First Requests

### List Users

Use the following commands, depending on your OS, to list users:

**macOS/Linux**

```bash
curl -sS "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json"
# Expected: 200 OK with a JSON array of users
```

**Windows**

```powershell
Invoke-RestMethod "$env:API_BASE/v1/users" -Headers @{
  Authorization = "Bearer $env:TOKEN"
  Accept        = "application/json"
}
# Expected: JSON array of users
```

### Create a user

Use the following commands, depending on your OS, to create a new user:

**macOS/Linux**

```bash
curl -sS -X POST "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"Ada Lovelace","email":"ada@example.com"}'
# Expected: 201 Created; response body is the new User; Location: /v1/users/{id}
```

**Windows**

```powershell
$body = '{"name":"Ada Lovelace","email":"ada@example.com"}'
Invoke-RestMethod "$env:API_BASE/v1/users" -Method POST -Headers @{
  Authorization = "Bearer $env:TOKEN"
  "Content-Type" = "application/json"
} -Body $body
```

### Possible errors

- 401: Missing/expired token or wrong header (`Authorization: Bearer <token>`).
- 403: Token lacks required roles/scopes.
- 409: Email already exists on create.
- 500: Server error.