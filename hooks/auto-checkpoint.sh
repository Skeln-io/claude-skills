#!/bin/bash
# Stop hook: auto-commit .claude directory changes on session end

cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

# Only checkpoint the .claude directory
git diff --quiet -- .claude/ && git diff --staged --quiet -- .claude/ && exit 0

git add .claude/
git commit -m "auto: checkpoint $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || true
