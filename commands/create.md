---
description: Create a new Apple Note
allowed-tools: Bash(notes:*)
argument-hint: <title> --body "content" [--folder "Folder"]
---

# Create Note

Create a new note in Apple Notes.

## Instructions

Create the note using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" create "$ARGUMENTS"
```

## Examples

- `/notes:create "Meeting Notes" --body "Agenda items..."` - Create a note with content
- `/notes:create "Shopping List" --body "Milk, Eggs" --folder "Personal"` - Create in specific folder
