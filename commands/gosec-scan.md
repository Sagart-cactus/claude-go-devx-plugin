---
description: Run static security analysis using gosec.
---
Run static security checks with `${CLAUDE_PROJECT_DIR}/scripts/gosec-scan.sh`.

Checks for code-level security issues like SQL injection, weak crypto, file traversal, etc.

Example: `/go:gosec-scan`

Complements govulncheck (dependency vulnerabilities) with code-level analysis.

Common findings:
- G104: Unhandled errors
- G401/G501: Weak crypto algorithms
- G201/G202: SQL injection risks
- G304: File path traversal

Run: during code reviews, before releases, or as part of CI.
