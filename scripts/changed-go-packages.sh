#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-HEAD}"

if ! command -v go >/dev/null 2>&1; then
  echo "go toolchain not found" >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "./..."
  exit 0
fi

files=()
while IFS= read -r file; do
  [[ -n "$file" ]] && files+=("$file")
done < <(git diff --name-only --diff-filter=ACMRTUXB "$base_ref" -- '*.go' 2>/dev/null || true)
if [[ "${#files[@]}" -eq 0 ]]; then
  while IFS= read -r file; do
    [[ -n "$file" ]] && files+=("$file")
  done < <(git ls-files --others --exclude-standard -- '*.go' 2>/dev/null || true)
fi

if [[ "${#files[@]}" -eq 0 ]]; then
  echo "./..."
  exit 0
fi

declare -A seen=()
pkgs=()
for file in "${files[@]}"; do
  [[ -f "$file" ]] || continue
  dir="$(dirname "$file")"
  [[ "$dir" == "." ]] && dir=""
  key="${dir:-.}"
  [[ -n "${seen[$key]:-}" ]] && continue
  seen[$key]=1

  if [[ -n "$dir" ]]; then
    pkg=$(go list "./$dir" 2>/dev/null || true)
  else
    pkg=$(go list . 2>/dev/null || true)
  fi

  [[ -n "$pkg" ]] && pkgs+=("$pkg")
done

if [[ "${#pkgs[@]}" -eq 0 ]]; then
  echo "./..."
  exit 0
fi

printf '%s\n' "${pkgs[@]}" | sort -u
