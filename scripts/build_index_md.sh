#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

parts=(
  "content/00-intro.md"
  "content/10-research.md"
  "content/20-team.md"
  "content/30-publications.md"
  "content/40-contacts.md"
)

for part in "${parts[@]}"; do
  if [[ ! -f "$part" ]]; then
    echo "Missing content file: $part" >&2
    exit 1
  fi
done

awk 'FNR==1 && NR!=1 { print ""; print "" } { print }' "${parts[@]}" > index.md
