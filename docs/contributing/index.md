# Contributing (Docs)

## Branch & PR
- Branch: `feat/*` or `fix/*`
- PR: short description + screenshot of the page

## Local checks
```bash
pip install mkdocs-material
mkdocs build --strict
vale .
```

## CI
- Build (mkdocs)
- Broken links (lychee)
- Style (Vale)
