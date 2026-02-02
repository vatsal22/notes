# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
./setup.sh          # Install dependencies (first-time setup for plugin usage)
pnpm build          # Compile TypeScript to dist/
pnpm dev            # Watch mode for development
pnpm typecheck      # Type check without emitting
pnpm lint           # Run oxlint
pnpm test           # Run tests
pnpm test:watch     # Run tests in watch mode

make install        # Build and link globally
make clean          # Remove dist/ and node_modules/
```

## Architecture

Dual-mode CLI/MCP tool for searching and managing Apple Notes:

```
src/
├── index.ts       # Entry point - routes to CLI or MCP mode based on --mcp flag
├── cli.ts         # Commander-based CLI (search, recent, folders, read, create, delete commands)
├── mcp.ts         # MCP server exposing tools via @modelcontextprotocol/sdk
├── applescript.ts # AppleScript automation for create/delete operations
├── indexer.ts     # Builds search indexes from Apple Notes database
├── searcher.ts    # Queries indexes with fuzzy matching via MiniSearch
├── formatter.ts   # Terminal output formatting with chalk
└── types.ts       # Shared types and Apple date conversion utilities
```

**Data flow:**
1. `indexer.ts` reads Apple's `NoteStore.sqlite` database from `~/Library/Group Containers/group.com.apple.notes/`
2. Extracts text from gzipped note body data (protobuf-like format)
3. Creates two indexes in `~/.notes/`: FTS5 SQLite for exact search, MiniSearch JSON for fuzzy matching
4. `searcher.ts` queries MiniSearch for fuzzy results, then fetches full data from SQLite

**Key dependencies:**
- `better-sqlite3`: Read Apple Notes DB and create FTS5 index
- `minisearch`: Fuzzy search with typo tolerance
- `@modelcontextprotocol/sdk`: MCP server for Claude Code integration
- `tsx`: Execute TypeScript files directly (for plugin skills)

## Claude Code Plugin

This repo is also a Claude Code plugin with skills and slash commands:

```
.claude-plugin/
├── plugin.json       # Plugin manifest
└── marketplace.json  # Marketplace definition (name: cardmagic)

skills/notes/SKILL.md    # Auto-invoked skill for note queries
commands/
├── search.md            # /notes:search slash command
├── recent.md            # /notes:recent slash command
├── folders.md           # /notes:folders slash command
├── folder.md            # /notes:folder slash command
├── read.md              # /notes:read slash command
├── create.md            # /notes:create slash command
├── delete.md            # /notes:delete slash command
└── edit.md              # /notes:edit slash command
```

**Plugin Setup:**

Skills execute TypeScript source directly via `npx tsx` instead of requiring global npm installation.

1. After cloning/installing the plugin, run setup script:
   ```bash
   cd /path/to/notes-cli
   ./setup.sh
   ```

2. Skills are self-contained and automatically:
   - Find the plugin directory via relative paths (no environment variables needed)
   - Install dependencies if missing (first-time only)
   - Execute commands via `skills/notes/scripts/notes-cli.sh`

## Releasing

When asked to "bump version to X" or "tag vX.Y.Z":

1. Update `package.json` version field to the new version
2. Update `server.json` version field to match
3. Commit: `git add package.json server.json && git commit -m "chore: bump version to X.Y.Z"`
4. Tag: `git tag vX.Y.Z`
5. Push: `git push && git push origin vX.Y.Z`

GitHub Actions will automatically publish to npm on version tags.

**First-time setup:**
1. Create GitHub environment `npm` at repo settings
2. Publish manually once: `npm login && npm publish --access public`
3. Add NPM_TOKEN secret for publishing
