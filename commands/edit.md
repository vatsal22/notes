---
description: Edit an existing Apple Note
allowed-tools: Bash(notes:*)
argument-hint: <id> --body "new content" [--folder "Folder"]
---

# Edit Note

Edit an existing note in Apple Notes. The created timestamp is preserved.

## Instructions

Edit the note using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" edit $ARGUMENTS
```

## Examples

- `/notes:edit 123 --body "Updated content"` - Edit note by ID
- `/notes:edit --title "Meeting Notes" --body "New agenda"` - Edit by title
- `/notes:edit --title "Todo" --body "New tasks" --folder "Work"` - Edit with folder disambiguation

## Workflow

1. Find the note: Use `/notes:search "keyword"` or `/notes:recent`
2. Read current content: Use `/notes:read <id>`
3. Edit the note: Use `/notes:edit <id> --body "new content"`
