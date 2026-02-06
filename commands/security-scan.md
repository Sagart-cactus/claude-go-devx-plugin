---
description: Scan for security vulnerabilities using govulncheck.
---
Run security scanning with `${CLAUDE_PROJECT_DIR}/scripts/security-scan.sh`.

Uses Go's official govulncheck tool to identify reachable vulnerabilities in your dependency tree.

Example: `/go:security-scan`

When vulnerabilities found:
1. Review the call stack to understand the risk
2. Update the vulnerable dependency: `go get -u vulnerable/package@latest`
3. Run `go mod tidy`
4. Re-run security scan to verify fix
5. Run full test suite to ensure compatibility

Run: before releases, after dependency updates, or weekly.
