---
description: Search Apple Notes with fuzzy matching
allowed-tools: Bash(notes:*)
argument-hint: <query>
---

# Search Notes

Search through Apple Notes using fuzzy matching.

## Instructions

Run the search using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" search "$ARGUMENTS"
```

## Examples

- `/notes:search recipe` - Find notes about recipes
- `/notes:search "tax 2024"` - Find tax-related notes from 2024
