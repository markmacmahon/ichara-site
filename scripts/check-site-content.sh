#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# Files we care about for content checks
CHECK_PATHS=(
  "README.md"
  "AGENTS.md"
  "site"
)

# 1) No em dash in content files
if command -v rg >/dev/null 2>&1; then
  if rg -n "—" "${CHECK_PATHS[@]}" >/tmp/ichara_emdash_hits.txt; then
    echo "Check failed: found em dashes (—) in content files:" >&2
    cat /tmp/ichara_emdash_hits.txt >&2
    exit 1
  fi
else
  if grep -RIn "—" "${CHECK_PATHS[@]}" >/tmp/ichara_emdash_hits.txt; then
    echo "Check failed: found em dashes (—) in content files:" >&2
    cat /tmp/ichara_emdash_hits.txt >&2
    exit 1
  fi
fi

# 2) Required files exist
required=(
  "site/index.html"
  "site/styles.css"
  "site/CNAME"
  ".github/workflows/pages.yml"
)
for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "Check failed: missing required file: $f" >&2
    exit 1
  fi
done

# 3) No cross-repo links to p-branding in public site files
if command -v rg >/dev/null 2>&1; then
  if rg -n "p-branding|github.com/markmacmahon/p-branding" site >/tmp/ichara_repo_link_hits.txt; then
    echo "Check failed: found cross-repo links in site content:" >&2
    cat /tmp/ichara_repo_link_hits.txt >&2
    exit 1
  fi
fi

echo "All site content checks passed."
