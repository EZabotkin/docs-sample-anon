.PHONY: build check-links

build:
	. .venv/bin/activate && python -m mkdocs build --strict

check-links:
	@if command -v lychee >/dev/null 2>&1; then \
	  lychee --config lychee.toml --no-progress --verbose \
	    README.md docs/**/*.md site/**/*.html ; \
	elif command -v brew >/dev/null 2>&1; then \
	  echo "Lychee not found. Install with Homebrew: brew install lychee"; exit 127; \
	elif command -v cargo >/dev/null 2>&1; then \
	  echo "Lychee not found. Install with Cargo: cargo install lychee"; exit 127; \
	else \
	  echo "Lychee not found. Install with Homebrew (macOS) or Cargo (Linux)."; exit 127; \
	fi

