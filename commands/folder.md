---
description: List notes in a specific folder
allowed-tools: Bash(notes:*)
argument-hint: <folder_name>
---

# Notes in Folder

List all notes in a specific Apple Notes folder.

## Instructions

List notes in folder using the self-contained wrapper:

```bash
# Get absolute path to wrapper script
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/notes/scripts" && pwd)/notes-cli.sh"

# Execute command
"$SCRIPT_PATH" folder "$ARGUMENTS"
```

## Examples

- `/notes:folder Taxes` - List notes in Taxes folder
- `/notes:folder "Business Ideas"` - List notes in Business Ideas folder
