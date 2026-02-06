#!/usr/bin/env bash
set -euo pipefail

echo "Installing Go developer tools..."
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/psampaz/go-mod-outdated@latest
go install golang.org/x/perf/cmd/benchstat@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install github.com/pressly/goose/v3/cmd/goose@latest

echo "Done. Ensure $(go env GOPATH)/bin is in PATH."
