# Dokumentationswebsite lokal installieren, bauen und in der Vorschau anzeigen

Dieses Repository enthält die Konfiguration für  Dokumentation zu einer Take-Home-Aufgabe von IONOS.

## Voraussetzungen

- Python 3.10+ und `pip`.
- Installierte MkDocs. Bitte beachten Sie [MkDocs Installation Guide](https://www.mkdocs.org/user-guide/installation/#installing-mkdocs) zur Installation von MkDocs.
- Git.
- (optional) ein Terminal mit UTF-8-Unterstützung.

!!! tip "Tipp"
    Verwenden Sie eine virtuelle Umgebung, damit Ihre globale Python-Installation sauber bleibt.

    Nutzen Sie die folgenden Befehle, um eine virtuelle Umgebung zu erstellen und zu aktivieren:

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

## Website lokal in der Vorschau anzeigen

Um die Website lokal in der Vorschau anzuzeigen:

1. **Abhängigkeiten installieren**

    ```bash
    pip install -r requirements.txt
    ```

2. **Lokalen Vorschau-Server starten**

    ```bash
    python -m mkdocs serve
    ```

    !!! info "Wichtig"
        Die Website lädt automatisch neu, sobald Sie eine Datei ändern.

3. Öffnen Sie die im Terminal ausgegebene URL (meist <http://127.0.0.1:8000>).

## Dokumentation bauen

Verwenden Sie den folgenden Befehl, um die Website zu bauen:

```bash
python -m mkdocs build
````

!!! tip "Tipp"
Verwenden Sie die Option `--strict`, um den Build bei defekten Links oder Konfigurationsproblemen fehlschlagen zu lassen.

Die statische Website wird im Verzeichnis `./site` erzeugt.

## Hinweise zu i18n (EN/DE)

- Seiten mit der Endung `.de.md` werden auf Deutsch angezeigt.
- Um in der deutschen Version nicht übersetzte Seiten auszublenden, setzen Sie `fallback_to_default: false` in `mkdocs.yml`.

## Fehlerbehebung

- `Unrecognised theme name: 'material'` → Installieren Sie das Theme in der virtuellen Umgebung:

  ```bash
  pip install -r requirements.txt
  ```

  Führen Sie anschließend `python -m mkdocs serve` erneut aus.

- `mkdocs not found` → Verwenden Sie `python -m mkdocs serve` (Windows: `py -m mkdocs serve`).

- `Port in use` → Adresse und Port explizit angeben:

  ```bash
  python -m mkdocs serve -a 127.0.0.1:8001
  ```

- **Build schlägt aufgrund der i18n-Konfiguration fehl** → Stellen Sie sicher, dass `plugins.i18n.languages` eine Liste ist (siehe `mkdocs.yml`), kein Dict.
