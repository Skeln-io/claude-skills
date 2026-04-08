#!/bin/bash
# SessionStart hook: inject date, branch, and git status as context

DATE=$(date '+%Y-%m-%d')
BRANCH=$(git -C "$CLAUDE_PROJECT_DIR" branch --show-current 2>/dev/null || echo 'unknown')
STATUS=$(git -C "$CLAUDE_PROJECT_DIR" status --short 2>/dev/null)

echo "Today: $DATE | Branch: $BRANCH"

if [ -n "$STATUS" ]; then
  CHANGED=$(echo "$STATUS" | wc -l | tr -d ' ')
  echo "Uncommitted changes ($CHANGED files): $(echo "$STATUS" | head -5 | awk '{print $2}' | tr '\n' ', ' | sed 's/,$//')"
else
  echo "Working tree: clean"
fi
