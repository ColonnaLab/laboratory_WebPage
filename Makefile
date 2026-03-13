SHELL := /bin/bash

PORT ?= 8000

.PHONY: help update check-tools preview preview-file

help:
	@echo "Available targets:"
	@echo "  make update      Build index.md from content/ then convert to index.adoc and index.html"
	@echo "  make check-tools Verify pandoc and asciidoctor are installed"
	@echo "  make preview     Build and serve website at http://localhost:$(PORT)/index.html"
	@echo "  make preview-file Build and print local file path to open directly"

check-tools:
	@command -v pandoc >/dev/null || { echo "Missing: pandoc"; exit 1; }
	@command -v asciidoctor >/dev/null || { echo "Missing: asciidoctor"; exit 1; }
	@echo "Tools OK: pandoc, asciidoctor"

update: check-tools
	@./scripts/update_site.sh

preview: update
	@command -v python3 >/dev/null || { echo "Missing: python3"; exit 1; }
	@echo "Preview running at http://localhost:$(PORT)/index.html"
	@echo "Press Ctrl+C to stop."
	@python3 -m http.server $(PORT) --bind 127.0.0.1

preview-file: update
	@echo "Open this file in your browser:"
	@pwd | awk '{print "file://" $$1 "/index.html"}'
