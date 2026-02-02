#!/usr/bin/env bash
# Setup script for notes-cli plugin

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Installing dependencies for notes-cli..."

if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    npm install -g pnpm
fi

pnpm install

echo "Setup complete! Dependencies installed at $SCRIPT_DIR/node_modules"
