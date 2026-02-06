#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-HEAD}"
pkgs=()
while IFS= read -r pkg; do
  [[ -n "$pkg" ]] && pkgs+=("$pkg")
done < <("$(dirname "$0")/changed-go-packages.sh" "$base_ref")

if [[ "${#pkgs[@]}" -eq 0 ]]; then
  pkgs=("./...")
fi

echo "Running targeted tests for: ${pkgs[*]}"
go test -count=1 "${pkgs[@]}"
