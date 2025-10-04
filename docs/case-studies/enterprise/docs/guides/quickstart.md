---
version: 1.0.0
last_updated: 2025-09-14
author: Evgenii Zabotkin
---

# User API Quick Start Guide

## Introduction

This API allows you to manage users. This guide will give minimal commands to **list** and **create** users right from your Terminal.

## Setting Environment Variables

Before making requests described below, set the environment variables. 

Use the following commands to do this (consider your OS):

**macOS/Linux (bash/zsh)**

```bash
export API_BASE="https://api.example.com"
export TOKEN="eyJhbGciOi..."   # your access token
```

**Windows (PowerShell)**

```powershell
$env:API_BASE = "https://api.example.com"
$env:TOKEN    = "eyJhbGciOi..." # your access token
```

Now you are ready to make the **list** and **create** user requests.

## List Users

This request allows you to list users registered in the system.

The response contains an array of users.

Use the following commands to list users (consider your OS):

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

## Create a User

This request allows you to create a new user in the system.

The response contains a new `User`.

Use the following commands to create a user (consider your OS):

**cURL (macOS/Linux)**

```bash
curl -sS -X POST "$API_BASE/v1/users" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"John","email":"john@example.com"}'
```

**PowerShell (Windows)**

```powershell
$body = '{"name":"John","email":"john@example.com"}'
Invoke-RestMethod "$env:API_BASE/v1/users" -Method POST -Headers @{
  Authorization = "Bearer $env:TOKEN"
  "Content-Type" = "application/json"
} -Body $body
```

Refer to [API Reference](../reference/users.md) to get more information on the Users API.
