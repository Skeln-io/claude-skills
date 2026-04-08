#!/bin/bash
# PreToolUse hook: blocks git push until /review has been run this session

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // empty')

# Only apply to git push commands
if ! echo "$COMMAND" | grep -qE '^git push'; then
  exit 0
fi

# Fail open if session ID is missing
if [[ -z "$SESSION_ID" ]]; then
  exit 0
fi

FLAG_FILE="/tmp/reviewed-${SESSION_ID}"

if [ -f "$FLAG_FILE" ]; then
  rm -f "$FLAG_FILE"
  exit 0
fi

cat >&2 << EOF
Pre-push review required. Run /review to check changes with specialist agents, address any findings, then push again.

To bypass for trivial changes (typos, docs, config): touch /tmp/reviewed-${SESSION_ID}
EOF

exit 2
