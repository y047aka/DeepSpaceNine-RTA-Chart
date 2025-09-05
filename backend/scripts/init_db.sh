#!/usr/bin/env bash
# init_db.sh - Reinitialize the PostgreSQL database schema for the application.
# This script drops the existing `episodes` table (if any) and then runs the SQL schema defined in init.sql.

set -euo pipefail

# Configuration – adjust if your environment differs
HOST="postgres"
USER="user"
DB="app_db"
PASSWORD="passw0rd"  # If password authentication is required, ensure PGPASSWORD is set or .pgpass is configured.

# Export password for psql (avoid prompting)
export PGPASSWORD="$PASSWORD"

echo "Dropping existing episodes table if it exists..."
psql -h "$HOST" -U "$USER" -d "$DB" -c "DROP TABLE IF EXISTS episodes;"

echo "Applying schema from init.sql..."
psql -h "$HOST" -U "$USER" -d "$DB" -f "$(dirname "$0")/init.sql"

echo "Database initialization complete."
