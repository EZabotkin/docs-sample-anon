# IONOS Take-Home Assignment

## Introduction

This repository contains the docs site configuration and documentation samples for a take-home assignment from IONOS.

## Install, build, and preview the docs site locally

### Prerequisites

- Python 3.10+ and `pip`
- MkDocs static site generation installed. For more information on how to install MkDocs, please, refer to [MkDocs Installation Guide](https://www.mkdocs.org/user-guide/installation/#installing-mkdocs).
- Git
- (optional) a terminal with UTF-8 support

!!! tip "Tip"
    Use a virtual environment so your global Python stays clean.

    Use the following commands to create and activate a virtual environment:

    - **macOS/Linux**
  
        ```bash
        python -m venv .venv
        source .venv/bin/activate
        ```

    - **Windows (PowerShell)**
  
        ```bash
        py -m venv .venv
        .venv\Scripts\Activate.ps1
        ```

### Preview the site locally

To preview the site locally:

1. **Install dependencies**

    ```bash
    pip install -r requirements.txt
    ```

2. **Run the local preview server**

    ```bash
    python -m mkdocs serve
    ```

    !!! info "Important"
        The site will automatically reload when you change any file.

3. Open the URL printed in the terminal (usually <http://127.0.0.1:8000>).

### Build the docs

Use the following command to build the site:

```bash
python -m mkdocs build
```

!!! tip "Tip"
    Use the `--strict` option to fail the build on broken links or configuration issues.

The static site is generated in the `./site` directory.

### Notes on i18n (EN/DE)

- Pages with a `.de.md` suffix are shown in German.
- To hide untranslated pages in German, set `fallback_to_default: false` in `mkdocs.yml`.

### Troubleshooting

- `Unrecognised theme name: 'material'` → Install the theme inside the virtual environment:

    ```bash
    pip install -r requirements.txt
    ```

    Then run `python -m mkdocs serve` again.

- `mkdocs not found` → Use `python -m mkdocs serve` (Windows: `py -m mkdocs serve`).

- `Port in use` → Specify the address and port explicitly:

    ```bash
    python -m mkdocs serve -a 127.0.0.1:8001
    ```

- `Build fails due to i18n config` → Ensure `plugins.i18n.languages` is a list (see `mkdocs.yml`), not a dict.
