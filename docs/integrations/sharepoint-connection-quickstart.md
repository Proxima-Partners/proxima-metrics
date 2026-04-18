# SharePoint Connection Quickstart

This guide makes MCP calls to the Proxima connector fast and repeatable.

## 1) One-time setup

```bash
chmod +x scripts/mcp-quick.sh
```

Optional endpoint override (if connector URL changes):

```bash
export MCP_URL="http://localhost:8080/mcp"
```

## 2) Fast commands

List available tools:

```bash
scripts/mcp-quick.sh tools | jq
```

List files in a specific folder (faster than scanning all files):

```bash
scripts/mcp-quick.sh ls "Library"
scripts/mcp-quick.sh ls "Library/Meeting_transcripts"

# Diagnose a missing path and get suggestions
scripts/mcp-quick.sh probe "Library/CMS"

# Webflow is not a SharePoint folder; use the Webflow tool
scripts/mcp-quick.sh webflow
```

Semantic search:

```bash
scripts/mcp-quick.sh search "CMS stories Proxima"
```

Get file text (requires itemId + fileName):

```bash
scripts/mcp-quick.sh get "local::Highest_Search_Priority/PRIMARY SOURCE FOR MISSION.md" "PRIMARY SOURCE FOR MISSION.md"
```

## 3) What makes it quicker

- Reuses the correct MCP headers and endpoint every time.
- Uses tight network timeouts to fail fast when connector is unavailable.
- Avoids broad full-library calls when a folder-limited call is possible.
- Handles JSON escaping automatically so quoted queries and spaced paths do not break.

## 4) Recommended sequence for content ingestion

1. Check connector health once: `curl -s http://localhost:8080/health`.
2. Use folder-first listing with `ls` to narrow candidate files.
3. Use `search` only for ranking within selected areas.
4. Use `get` for final extraction of specific files.

This sequence reduces response size, avoids unnecessary semantic scans, and keeps each request focused.
