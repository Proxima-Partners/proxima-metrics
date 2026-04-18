#!/usr/bin/env bash
set -euo pipefail

# Fast helper for the local Proxima MCP connector.
BASE_URL="${MCP_URL:-http://localhost:8080/mcp}"
CURL_OPTS=(
  --silent
  --show-error
  --compressed
  --connect-timeout 3
  --max-time 60
  -H "Content-Type: application/json"
  -H "Accept: application/json, text/event-stream"
)

usage() {
  cat <<'EOF'
Usage:
  scripts/mcp-quick.sh tools
  scripts/mcp-quick.sh ls [folderPath]
  scripts/mcp-quick.sh probe <folderPath>
  scripts/mcp-quick.sh search <query>
  scripts/mcp-quick.sh get <itemId> <fileName>
  scripts/mcp-quick.sh webflow
  scripts/mcp-quick.sh webflow-items <collectionId>

Env:
  MCP_URL   Optional MCP endpoint (default: http://localhost:8080/mcp)
EOF
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

require_cmd curl
require_cmd jq

build_tools_list_payload() {
  jq -nc '{jsonrpc:"2.0", id:1, method:"tools/list", params:{}}'
}

build_tools_call_payload() {
  local id="$1"
  local tool_name="$2"
  local args_json="$3"
  jq -nc --argjson id "$id" --arg name "$tool_name" --argjson args "$args_json" \
    '{jsonrpc:"2.0", id:$id, method:"tools/call", params:{name:$name, arguments:$args}}'
}

post_payload() {
  local payload="$1"
  curl "${CURL_OPTS[@]}" -X POST "$BASE_URL" -d "$payload"
}

# Pull the JSON line from SSE response when server streams "event: message".
extract_data_line() {
  sed -n 's/^data: //p' | tail -n 1
}

run_tool_call() {
  local id="$1"
  local tool_name="$2"
  local args_json="$3"
  local payload
  payload="$(build_tools_call_payload "$id" "$tool_name" "$args_json")"
  post_payload "$payload" | extract_data_line
}

list_sharepoint_files() {
  local folder="${1:-}"
  local args_json
  if [[ -n "$folder" ]]; then
    args_json="$(jq -nc --arg folderPath "$folder" '{folderPath:$folderPath}')"
  else
    args_json='{}'
  fi
  run_tool_call 2 "list_sharepoint_files" "$args_json"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

case "$1" in
  tools)
    payload="$(build_tools_list_payload)"
    post_payload "$payload" | extract_data_line
    ;;
  ls)
    folder="${2:-}"
    list_sharepoint_files "$folder"
    ;;
  probe)
    if [[ $# -lt 2 ]]; then
      echo "probe requires folderPath" >&2
      usage
      exit 1
    fi
    folder="$2"
    result_json="$(list_sharepoint_files "$folder")"
    if jq -e '.result.isError == true' >/dev/null 2>&1 <<<"$result_json"; then
      error_text="$(jq -r '.result.content[0].text // "Unknown error"' <<<"$result_json")"
      echo "Warning: probe failed for $folder ($error_text)"

      if [[ "$folder" == "Library/Webflow" ]]; then
        echo "Webflow content is exposed by MCP Webflow tools, not SharePoint folder paths."
        echo "Try: scripts/mcp-quick.sh webflow"
      fi
      exit 0
    fi
    echo "$result_json"
    ;;
  search)
    if [[ $# -lt 2 ]]; then
      echo "search requires a query" >&2
      usage
      exit 1
    fi
    query="$2"
    args_json="$(jq -nc --arg query "$query" '{query:$query}')"
    payload="$(build_tools_call_payload 3 "search_documents" "$args_json")"
    post_payload "$payload" | extract_data_line
    ;;
  get)
    if [[ $# -lt 3 ]]; then
      echo "get requires itemId and fileName" >&2
      usage
      exit 1
    fi
    item_id="$2"
    file_name="$3"
    args_json="$(jq -nc --arg itemId "$item_id" --arg fileName "$file_name" '{itemId:$itemId, fileName:$fileName}')"
    run_tool_call 4 "get_file_content" "$args_json"
    ;;
  webflow)
    run_tool_call 5 "list_webflow_collections" '{}'
    ;;
  webflow-items)
    if [[ $# -lt 2 ]]; then
      echo "webflow-items requires collectionId" >&2
      usage
      exit 1
    fi
    collection_id="$2"
    args_json="$(jq -nc --arg collectionId "$collection_id" '{collectionId:$collectionId}')"
    run_tool_call 6 "get_collection_items" "$args_json"
    ;;
  *)
    usage
    exit 1
    ;;
esac
