#!/usr/bin/env bash
set -euo pipefail

log_file="${1:-}"

if [[ -z "$log_file" || ! -f "$log_file" ]]; then
  echo "Usage: $0 <path-to-failure-log>" >&2
  exit 1
fi

if grep -qE "(undefined:|cannot use|does not implement|build failed)" "$log_file"; then
  echo "Category: Compile-time error"
  echo "Next step: Fix type/signature mismatches first, then rerun focused tests."
  exit 0
fi

if grep -qE "(DATA RACE|WARNING: DATA RACE)" "$log_file"; then
  echo "Category: Concurrency/race issue"
  echo "Next step: Reproduce with -race, debug shared writes, inspect goroutines in dlv."
  exit 0
fi

if grep -qE "(panic:|fatal error: all goroutines are asleep - deadlock!)" "$log_file"; then
  echo "Category: Panic/deadlock"
  echo "Next step: Debug stack/goroutines, add guard assertions around state transitions."
  exit 0
fi

if grep -qE "(FAIL\s+.*\(.*s\)|--- FAIL:)" "$log_file"; then
  echo "Category: Test assertion regression"
  echo "Next step: Reproduce one test with dlv, inspect expected vs actual before mutation points."
  exit 0
fi

echo "Category: Unknown"
echo "Next step: Run failing target in verbose mode and capture full logs for focused triage."
