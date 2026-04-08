#!/bin/bash
# PostToolUse hook: runs formatter on files written or edited by Claude

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Only format supported file types
case "$FILE_PATH" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    # Try project-local prettier first, then global
    PRETTIER="$CLAUDE_PROJECT_DIR/node_modules/.bin/prettier"
    if [ -f "$PRETTIER" ]; then
      "$PRETTIER" --write "$FILE_PATH" 2>/dev/null
    elif command -v prettier &>/dev/null; then
      prettier --write "$FILE_PATH" 2>/dev/null
    fi
    ;;
  *.py)
    if command -v black &>/dev/null; then
      black "$FILE_PATH" 2>/dev/null
    elif command -v ruff &>/dev/null; then
      ruff format "$FILE_PATH" 2>/dev/null
    fi
    ;;
esac

exit 0
