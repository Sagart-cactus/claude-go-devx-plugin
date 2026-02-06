---
description: Manage database migrations using goose.
argument-hint: <command> [args]
---
Manage migrations with `${CLAUDE_PROJECT_DIR}/scripts/migrate.sh <command> [args]`.

Example: `DB_STRING='postgres://...' /go:migrate up`

Commands:
- `up`: Apply all pending migrations
- `down`: Rollback last migration
- `status`: Show migration status
- `create <name>`: Create new migration file

Environment variables:
- `DB_STRING`: Database connection string (required)
- `DB_DRIVER`: Database driver (default: postgres)
- `MIGRATIONS_DIR`: Migration directory (default: ./migrations)

Migration files are stored in `./migrations/` by default.
