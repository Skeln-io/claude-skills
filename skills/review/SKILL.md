---
name: review
description: Internal code review using specialist agents before pushing. Runs build + lint, dispatches specialist agents, blocks git push until findings are addressed.
disable-model-invocation: true
argument-hint: "[optional: describe what changed]"
---

Run an internal code review on the current changes.

## Steps

1. Run `git diff HEAD` and `git diff --staged` to see all current changes. Run `git status` for untracked files relevant to this work.

2. Read the project's build and lint commands from `config/brands/` (look for the `Dev` section) or detect from `package.json`. Run quality checks:
   ```bash
   # Example — adapt to the project's actual commands:
   # npm run build
   # npm run lint
   ```
   Fix any lint or type errors before proceeding.

3. Analyse what changed:
   - TypeScript, API routes, services, shared types, data fetching → involves **typescript-pro** agent
   - UI components, pages, layouts, responsive design, user flows → involves **ui-designer** agent
   - Both → run both agents in parallel

4. Launch the relevant specialist agent(s) with:
   - A summary of what was implemented
   - The actual diff or key changed files to review
   - Ask them to identify: bugs, type safety issues, missing edge cases, pattern violations, accessibility issues (ui-designer), UX problems (ui-designer)

5. Present findings in a clear summary:
   - **Must fix** before pushing
   - **Worth considering** (suggestions)
   - **Looks good** (what's solid)

6. Fix any blocking issues found, re-run quality checks to confirm they pass.

7. When everything is clean, signal that the push gate is cleared:
   ```bash
   touch /tmp/reviewed-${CLAUDE_SESSION_ID}
   ```
   Then proceed to commit (if not already done) and push.

$ARGUMENTS
