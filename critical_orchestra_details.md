# Critical Orchestra MCP Setup Details

## What Works

```bash
claude mcp add --transport http --scope local orchestra-mcp http://localhost:8765/mcp
```

This writes to `~/.claude.json` with a project-specific config and Claude Code detects it.

## What Doesn't Work

### 1. Manual `.claude/mcp.json` file
Creating a file at `.claude/mcp.json` in the project:
```json
{
  "mcpServers": {
    "orchestra-mcp": {
      "type": "http",
      "url": "http://localhost:8765/mcp"
    }
  }
}
```
**Result**: Claude Code ignores it, `/mcp` shows "No MCP servers configured"

### 2. Manual `.mcp.json` in project root
Same content in `.mcp.json` at project root.
**Result**: Also ignored by Claude Code

### 3. `--scope project` flag
```bash
claude mcp add --transport http --scope project orchestra-mcp http://localhost:8765/mcp
```
**Result**: Creates `.mcp.json` in project root, but `claude mcp list` still shows nothing

## Why `--scope local` Works

The `local` scope writes to `~/.claude.json` with a project path association:
```
File modified: /home/matt/.claude.json [project: /home/matt/thing/ecomm-hacks-starter]
```

Claude Code reads this global config and matches it to the current project directory.

## Verification

After adding, verify with:
```bash
claude mcp list
```

Should show:
```
orchestra-mcp: http://localhost:8765/mcp (HTTP) - ✓ Connected
```

Then restart Claude Code for the session to pick up the MCP tools.
