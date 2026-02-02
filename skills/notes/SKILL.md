---
name: notes
description: Search, browse, create, and delete Apple Notes. Use when user asks about notes, wants to find something in notes, create a new note, or delete notes.
triggers:
  - "notes"
  - "apple notes"
  - "find note"
  - "search notes"
  - "my notes"
  - "list notes"
  - "read note"
  - "create note"
  - "add note"
  - "new note"
  - "delete note"
  - "remove note"
---

# Apple Notes Skill

Search, browse, create, and delete Apple Notes with fuzzy matching.

This skill is self-contained and automatically handles dependency installation.

## Commands

All commands use the self-contained wrapper at `./scripts/notes-cli.sh`:

### Search notes
```bash
./scripts/notes-cli.sh search "query" [-l limit] [-f folder] [-a after_date]
```

### Recent notes
```bash
./scripts/notes-cli.sh recent [-l limit]
```

### Read a note by ID
```bash
./scripts/notes-cli.sh read <id>
```

### List folders
```bash
./scripts/notes-cli.sh folders [-l limit]
```

### Notes in folder
```bash
./scripts/notes-cli.sh folder "folder_name" [-l limit]
```

### Create a note
```bash
./scripts/notes-cli.sh create "Title" --body "Content" [--folder "Folder"]
```

### Delete a note
```bash
./scripts/notes-cli.sh delete "Title" [--folder "Folder"]
```

### Edit a note
```bash
./scripts/notes-cli.sh edit <id> --body "new content" [--title "New Title"]
```

### Index statistics
```bash
./scripts/notes-cli.sh stats
```

### Rebuild index
```bash
./scripts/notes-cli.sh index [-f|--force]
```

## Examples

- Search for "recipe": `./scripts/notes-cli.sh search "recipe"`
- Recent notes: `./scripts/notes-cli.sh recent`
- Notes in Taxes folder: `./scripts/notes-cli.sh folder Taxes`
- Read note ID 123: `./scripts/notes-cli.sh read 123`
- Create a note: `./scripts/notes-cli.sh create "Meeting Notes" --body "Agenda items..."`
- Delete a note: `./scripts/notes-cli.sh delete "Old Draft"`
- Edit a note: `./scripts/notes-cli.sh edit 123 --body "Updated content"`
