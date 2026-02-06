#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-HEAD}"

# Validate git ref if in a git repo
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if ! git rev-parse --verify "$base_ref" >/dev/null 2>&1; then
    echo "Error: Invalid git reference '$base_ref'" >&2
    exit 1
  fi
fi

pkgs=()
while IFS= read -r pkg; do
  [[ -n "$pkg" ]] && pkgs+=("$pkg")
done < <("$(dirname "$0")/changed-go-packages.sh" "$base_ref")

if [[ "${#pkgs[@]}" -eq 0 ]]; then
  pkgs=("./...")
fi

echo "Running targeted tests for: ${pkgs[*]}"
go test -count=1 "${pkgs[@]}"
