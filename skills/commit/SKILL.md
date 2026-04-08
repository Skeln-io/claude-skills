---
name: commit
description: Create a conventional commit for current changes. Stages the right files, generates a well-formed commit message, and creates the commit.
disable-model-invocation: true
argument-hint: "[optional: hint about what changed]"
---

Create a conventional commit for the current changes.

## Steps

1. Run `git status` and `git diff` to see all changes. Run `git diff --staged` to see what's already staged.

2. Stage the appropriate files:
   - Include all files relevant to this change
   - Never stage: `.env*`, credential files, unrelated changes
   - Use specific file paths — never `git add .` or `git add -A`

3. Generate a commit message following conventional commits:
   - Format: `type: description` or `type(scope): description`
   - Types: `feat`, `fix`, `refactor`, `docs`, `tooling`, `style`, `test`, `chore`
   - Subject line: imperative tense, under 72 characters, no full stop
   - Add a short body if the change is non-obvious
   - No em dashes — use hyphens

4. Create the commit using a heredoc:
   ```bash
   git commit -m "$(cat <<'EOF'
   type: description

   Optional body here.

   Co-Authored-By: Claude <noreply@anthropic.com>
   EOF
   )"
   ```

5. Confirm what was committed with `git log --oneline -1`.

$ARGUMENTS
