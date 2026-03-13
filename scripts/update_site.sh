#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/4] Building index.md from content sections..."
./scripts/build_index_md.sh

echo "[2/4] Converting Markdown to AsciiDoc..."
pandoc -f gfm -t asciidoc index.md -o .index.from_md.adoc

cat > .index.header.adoc <<'EOF'
= *Colonna Lab*
:figure-caption!:
:toc-title: Page Content
:toc: left
:toclevels: 1
:hide-uri-scheme:
:docinfo: shared

EOF

cat .index.header.adoc .index.from_md.adoc > index.adoc
rm -f .index.header.adoc .index.from_md.adoc

echo "[3/4] Building HTML from AsciiDoc..."
asciidoctor index.adoc

echo "[4/4] Done."
echo "Updated files:"
echo "  - index.md"
echo "  - index.adoc"
echo "  - index.html"
