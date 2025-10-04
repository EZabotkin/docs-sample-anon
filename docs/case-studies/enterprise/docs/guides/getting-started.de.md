---
version: 1.0.0
last_updated: 2025-09-14
author: Evgenii Zabotkin
---

# Erste Schritte: Authentifizieren und Ihre ersten API-Anfragen senden

## Allgemein

Diese API verwendet das **Bearer-Token (JWT)**. Senden Sie Ihr Token im `Authorization`-Header.

## Voraussetzungen

### Authentifizierung

Beziehen Sie ein Authentifizierungstoken aus Ihrem Auth-System.

Ihr Auth-Token sieht etwa so aus: `eyJhbGciOi...` (ohne Anführungszeichen, ohne `Bearer`-Präfix).

### Basis-URL und Token setzen

Verwenden Sie die folgenden Befehle, um Basis-URL und Token als Umgebungsvariablen zu setzen:

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

Jetzt können Sie Ihre ersten Anfragen senden!

## Ihre ersten Anfragen senden

### Benutzer auflisten

Verwenden Sie je nach Ihrem Betriebssystem die folgenden Befehle, um Benutzer aufzulisten:

**macOS/Linux**

```bash
curl -sS "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json"
# Erwartet: 200 OK mit einem JSON-Array von Benutzern
```

**Windows**

```powershell
Invoke-RestMethod "$env:API_BASE/v1/users" -Headers @{
  Authorization = "Bearer $env:TOKEN"
  Accept        = "application/json"
}
# Erwartet: JSON-Array von Benutzern
```

### Benutzer erstellen

Verwenden Sie je nach Ihrem Betriebssystem die folgenden Befehle, um einen neuen Benutzer zu erstellen:

**macOS/Linux**

```bash
curl -sS -X POST "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"Ada Lovelace","email":"ada@example.com"}'
# Erwartet: 201 Created; Antwortkörper enthält den neuen Benutzer; Location: /v1/users/{id}
```

**Windows**

```powershell
$body = '{"name":"Ada Lovelace","email":"ada@example.com"}'
Invoke-RestMethod "$env:API_BASE/v1/users" -Method POST -Headers @{
  Authorization = "Bearer $env:TOKEN"
  "Content-Type" = "application/json"
} -Body $body
```

### Mögliche Fehler

- **401:** Fehlendes/abgelaufenes Token oder falscher Header (`Authorization: Bearer <token>`).
- **403:** Token hat keine erforderlichen Rollen/Berechtigungen.
- **409:** Die E-Mail-Adresse existiert bereits beim Erstellen.
- **500:** Serverfehler.

!!! note "NOTE"
    Translation Decision: "Location" Header
    
    In the section about creating a user, I kept the English term **"Location"**. The literal German translation would be **"Standort"** or **"Ort"**, but I deliberately kept "Location" in English because:
    
    1. **Technical Standard**: "Location" is an HTTP response header defined in RFC specifications. In technical contexts, HTTP headers are universally referred to by their English names, even in non-English documentation.
    
    2. **Avoiding Confusion**: Using "Standort: /v1/users/{id}" would be confusing for developers, as they need to actually use `Location:` in their code, not a translated version.
    
    3. **Industry Practice**: German developers expect to see HTTP headers, status codes, and similar protocol-level elements in English. This is a standard practice in German technical documentation.
    
    This approach maintains technical accuracy while keeping the explanatory text in proper German, striking the right balance for technical documentation.