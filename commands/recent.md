---
description: Show recently modified Apple Notes
allowed-tools: Bash(notes:*)
argument-hint: [limit]
---

# Recent Notes

Show the most recently modified Apple Notes.

## Instructions

Show recent notes using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" recent ${ARGUMENTS:+-l $ARGUMENTS}
```

## Examples

- `/notes:recent` - Show 20 most recent notes
- `/notes:recent 10` - Show 10 most recent notes
