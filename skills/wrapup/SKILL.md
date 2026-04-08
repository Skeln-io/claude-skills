---
name: wrapup
description: End-of-session closeout — commit, push, and optionally post a Slack summary. Use when you say "wrap up", "done for now", "save everything", or similar.
---

# Session Wrapup

Run this sequence automatically, without asking for permission at each step.

## Step 1 — Commit & Push

For every repo that was worked on this session:

```bash
git status
git add <relevant files>
git commit -m "<type(scope): summary>"
git push
```

Use conventional commit format: `type(scope): summary` (e.g. `feat(auth): add login flow`)

## Step 2 — Slack (optional)

Only send a Slack message if the brand config has a Slack webhook and channel configured. Check `config/brands/` for the active brand.

If configured, post a short summary:

```
Session wrap-up

- <what was done - 1 line>
- <what was done - 1 line>
- <any blockers or next steps - optional>

Pushed to: <branch name or "main">
```

Keep it short. Write as if the user sent it themselves. No timestamps, no internal detail.

If no Slack config exists, skip this step entirely.

## Step 3 — Confirm

Reply with a single line:

> All done — committed, pushed[, posted to #channel-name].
