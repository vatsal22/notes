---
description: List Apple Notes folders
allowed-tools: Bash(notes:*)
argument-hint: [limit]
---

# List Folders

List all Apple Notes folders with note counts.

## Instructions

List folders using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" folders ${ARGUMENTS:+-l $ARGUMENTS}
```

## Examples

- `/notes:folders` - Show all folders
- `/notes:folders 10` - Show top 10 folders
