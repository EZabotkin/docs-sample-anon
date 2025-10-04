---
version: 1.0.0
last_updated: 2025-09-14
author: Evgenii Zabotkin
---

# User API Reference

## General

- **OpenAPI:** 3.0.0
- **Title/Version:** User API / 1.0.0
- **Base URL:** not defined in spec (e.g., `https://api.example.com`)
- **Auth:** not defined in spec (see the "Improvements" section below)

## Media Types

* Requests: `application/json` (POST)
* Responses: `application/json` (GET 200; POST 201 lacks schema in spec)

## GET `/v1/users`

List all users.

### Request

* **Query parameters:** none defined.

  > **Gap:** No pagination/filtering/sorting parameters are specified.

* **Headers:** optional `Accept: application/json` (not mandated)

### Responses

* **200 OK** — returns an array of `User`.

  ```json
  [
    { "id": "123", "name": "Wednesday Addams", "email": "wadda@example.com" }
  ]
  ```
* **Errors:** none defined.

  > **Gap:** Should define at least `401`, `403`, `500` (and a reusable `Error` schema).

### Examples

**cURL (macOS/Linux)**

```bash
curl -sS "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json"
```

**PowerShell (Windows)**

```powershell
Invoke-RestMethod "$env:API_BASE/v1/users" -Headers @{
  Authorization = "Bearer $env:TOKEN"
  Accept        = "application/json"
}
```

## POST `/v1/users`

Create a new user.

### Request

* **Body schema:** `User`

  > **Gap:** Using `User` for creation allows clients to send server-managed fields (e.g., `id`). You should introduce a `NewUser` schema without read-only fields.

* **Headers:** `Content-Type: application/json`

* **Example body (what clients would reasonably send)**

  ```json
  { "name": "Ada Lovelace", "email": "ada@example.com" }
  ```

### Responses

* **201 Created** — **description only** (no content defined).

  > **Gaps:**
  > - No response body schema (should return the created `User`).
  > - No `Location` header pointing to `/v1/users/{id}`.
  > - No error responses: add `400` (validation), `409` (email conflict), `401/403`, `500`.

### Examples

**cURL (macOS/Linux)**

```bash
curl -sS -X POST "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"Ada Lovelace","email":"ada@example.com"}'
```

**PowerShell (Windows)**

```powershell
$body = '{"name":"Ada Lovelace","email":"ada@example.com"}'
Invoke-RestMethod "$env:API_BASE/v1/users" -Method POST -Headers @{
  Authorization = "Bearer $env:TOKEN"
  "Content-Type" = "application/json"
} -Body $body
```

## Schemas

### `User` (object)

- `id`: `string` — spec has an invalid stray token `SQL` here; also lacks `format`/`readOnly`.
- `name`: `string`
- `email`: `string` — present but missing description; consider `format: email`.

> **Gaps:** 
>
> - No `required` list. 
> - No descriptions. 
> - No `readOnly` markers. 
> - No formats. 
> - No examples.

# Gaps and Unclear Parts

1. `SQL` token under `User.properties.id` breaks the schema.
2. No `securitySchemes` or global `security` requirement specified.
3. Servers/base URL is missing.
4. POST request body needs a separate `NewUser` input schema, instead of using `User`.
5. POST `requestBody.required` is missing.
6. POST 201 response body is not defined and no `Location` header specified.
7. No error model/responses anywhere.
8. GET pagination/filtering/sorting is not defined (may return unbounded lists).
9. `User` schema issues: missing `required`, `format` (e.g., `uuid`, `email`), `readOnly` flags, and field descriptions.
10. Examples of requests and responses are absent.

## Suggested improvements

1. **Define server & bearer auth (if JWT is intended)**

    ```yaml
    servers:
      - url: https://api.example.com
    
    components:
      securitySchemes:
        bearerAuth:
          type: http
          scheme: bearer
          bearerFormat: JWT
    
    security:
      - bearerAuth: []
    ```

    > If you use a different auth method, replace accordingly.

2. **Fix `User` and add `NewUser`**

    ```yaml
    components:
      schemas:
        User:
          type: object
          description: A user record.
          properties:
            id:
              type: string
              format: uuid
              description: Unique user ID.
              readOnly: true
            name:
              type: string
              description: Full name.
              minLength: 1
            email:
              type: string
              format: email
              description: Email address.
          required: [id, name, email]
    
        NewUser:
          type: object
          description: Payload to create a user.
          properties:
            name:
              type: string
              minLength: 1
            email:
              type: string
              format: email
          required: [name, email]
    ```

3. **Add an error schema and reusable responses**

    ```yaml
    components:
      schemas:
        Error:
          type: object
          properties:
            code: { type: string }
            message: { type: string }
          required: [message]
    
      responses:
        BadRequest:
          description: Invalid input.
          content: { application/json: { schema: { $ref: '#/components/schemas/Error' } } }
        Unauthorized:
          description: Missing or invalid credentials.
          content: { application/json: { schema: { $ref: '#/components/schemas/Error' } } }
        Forbidden:
          description: Insufficient permissions.
          content: { application/json: { schema: { $ref: '#/components/schemas/Error' } } }
        Conflict:
          description: Duplicate resource (e.g., email already exists).
          content: { application/json: { schema: { $ref: '#/components/schemas/Error' } } }
        ServerError:
          description: Unexpected error.
          content: { application/json: { schema: { $ref: '#/components/schemas/Error' } } }
    ```

4. Tighten endpoints (pagination for GET; proper POST response)

    ```yaml
    paths:
      /v1/users:
        get:
          summary: List all users
          parameters:
            - name: page
              in: query
              description: 1-based page index.
              schema: { type: integer, minimum: 1, default: 1 }
            - name: per_page
              in: query
              description: Page size.
              schema: { type: integer, minimum: 1, maximum: 100, default: 25 }
          responses:
            '200':
              description: OK
              content:
                application/json:
                  schema:
                    type: array
                    items: { $ref: '#/components/schemas/User' }
            '401': { $ref: '#/components/responses/Unauthorized' }
            '403': { $ref: '#/components/responses/Forbidden' }
            '500': { $ref: '#/components/responses/ServerError' }
    
        post:
          summary: Create a new user
          requestBody:
            required: true
            content:
              application/json:
                schema: { $ref: '#/components/schemas/NewUser' }
          responses:
            '201':
              description: User created
              headers:
                Location:
                  description: URL of the created user
                  schema: { type: string, format: uri }
              content:
                application/json:
                  schema: { $ref: '#/components/schemas/User' }
            '400': { $ref: '#/components/responses/BadRequest' }
            '401': { $ref: '#/components/responses/Unauthorized' }
            '403': { $ref: '#/components/responses/Forbidden' }
            '409': { $ref: '#/components/responses/Conflict' }
            '500': { $ref: '#/components/responses/ServerError' }
    ```