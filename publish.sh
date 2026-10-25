#!/usr/bin/env bash
set -euo pipefail

repo_name="${1:-stephenkrings}"
owner="${2:-kringz}"

if ! command -v gh >/dev/null 2>&1; then
  printf '%s\n' 'GitHub CLI (gh) is required. Install it and run gh auth login first.' >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  printf '%s\n' 'GitHub CLI is not authenticated. Run gh auth login first.' >&2
  exit 1
fi

git init
git add .
git commit -m "Add stephenkrings.com static site snapshot"
gh repo create "${owner}/${repo_name}" --public --source=. --remote=origin --push

