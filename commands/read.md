---
description: Read an Apple Note by ID
allowed-tools: Bash(notes:*)
argument-hint: <note_id>
---

# Read Note

Read the full content of an Apple Note by its ID.

## Instructions

Read the note using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" read $ARGUMENTS
```

## Examples

- `/notes:read 123` - Read note with ID 123
