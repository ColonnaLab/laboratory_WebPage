#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/3] Converting Markdown to AsciiDoc..."
pandoc -f gfm -t asciidoc index.md -o index.adoc

echo "[2/3] Building HTML from AsciiDoc..."
asciidoctor index.adoc

echo "[3/3] Done."
echo "Updated files:"
echo "  - index.adoc"
echo "  - index.html"

