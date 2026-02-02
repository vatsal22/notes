#!/usr/bin/env bash
# Self-contained wrapper for notes-cli that finds its own directory
# This script lives at: skills/notes/scripts/notes-cli.sh
# Plugin root is: ../../../ (three levels up)

set -e

# Find the plugin root directory (scripts/ -> notes/ -> skills/ -> root)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# Install dependencies if missing (first-time setup)
if [ ! -d "$PLUGIN_DIR/node_modules/better-sqlite3" ]; then
  echo "Installing notes-cli dependencies..." >&2
  (cd "$PLUGIN_DIR" && pnpm install --silent)
fi

# Execute the command with all arguments passed through
npx tsx "$PLUGIN_DIR/src/index.ts" "$@"
