---
description: Delete an Apple Note by title
allowed-tools: Bash(notes:*)
argument-hint: <title> [--folder "Folder"]
---

# Delete Note

Delete a note from Apple Notes by its title.

## Instructions

Delete the note using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" delete "$ARGUMENTS"
```

## Examples

- `/notes:delete "Old Meeting Notes"` - Delete a note by title
- `/notes:delete "Draft" --folder "Work"` - Delete from specific folder (useful if multiple notes have the same title)
