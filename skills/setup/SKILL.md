---
name: setup
description: First-run project scaffolding — copies skills, hooks, agents, and config into your project. Run once per new project, or run '/setup brand' to add a new brand.
argument-hint: "[optional: 'brand' to add a new brand only]"
---

# Project Setup

Scaffolds the full Claude Code working system into your project.

## If argument is "brand"

Skip to **Step 3 (Brand Config)** only — don't re-scaffold skills, hooks, or agents.

## Step 1 — Project Info

Ask the user (one question at a time, max 3 questions total):

1. "What's your project called, and what type is it?" (ecom / SaaS / agency / other)
2. "What's your stack?" (detect from package.json if possible: package manager, framework, language)

If a `package.json` exists, read it first and confirm what you found instead of asking.

## Step 2 — Scaffold

Copy from the claude-skills repo into the user's project:

### Skills → `.claude/skills/`
Copy all skill folders. Each skill is self-contained in its own directory.

### Hooks → `.claude/hooks/`
Copy all hook scripts. Make them executable:
```bash
chmod +x .claude/hooks/*.sh
```

### Agents → `.claude/agents/`
Copy all agent definition files.

### Settings → `.claude/settings.json`
Create or merge into existing `.claude/settings.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/session-start.sh",
            "timeout": 5
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/pre-push-check.sh",
            "timeout": 5,
            "statusMessage": "Checking pre-push requirements..."
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/format-file.sh",
            "timeout": 10,
            "statusMessage": "Formatting..."
          }
        ]
      }
    ]
  },
  "enabledPlugins": {
    "superpowers@claude-plugins-official": true
  }
}
```

If `.claude/settings.json` already exists, merge hooks and plugins — don't overwrite existing config.

### CI → `.github/workflows/`
Copy CI templates. Remind the user to update placeholder URLs and secrets.

### CLAUDE.md
If no `CLAUDE.md` exists at project root, create one:

```markdown
# [Project Name]

## Rules
- Read and follow the rules in `.claude/skills/ppm/SKILL.md` at all times
- Bold the one most important thing
- One question at a time
- Bullets over prose
- Lead with the answer
- Tasks: small named steps, checkboxes

## Brand Config
Active brand config is in `config/brands/`. Brand-aware skills read from here.
```

If `CLAUDE.md` already exists, append the PPM include line and brand config note — don't overwrite.

## Step 3 — Brand Config

1. Ask: "What's your brand name?"
2. Ask: "Quick brand snapshot — voice/tone in 3-5 words, and who's your ideal customer in one sentence?" (or "I'll fill this in later")
3. Copy `config/brands/_template.md` → `config/brands/<brand-slug>.md`
4. Fill in what the user provided, leave the rest as template placeholders

## Step 4 — Profile

1. Ask: "How do you like to work? (a) Short bursts, need structure (b) Long deep focus sessions (c) Mixed / no preference"
2. Fill in `config/profile.md` based on answer

## Step 5 — Validate

Run the user's build command once to confirm hooks work:
```bash
# Use the build command from brand config, or detect from package.json
```

If it passes, confirm. If it fails, help fix before committing.

## Step 6 — Commit

```bash
git add .claude/ config/ CLAUDE.md .github/
git commit -m "feat: scaffold Claude Code working system via /setup"
```

## Step 7 — Confirm

Report what was set up:
- Skills installed (list them)
- Hooks active (list them)
- Agents available (list them)
- Brand config created (or skipped)
- PPM active

One line: "You're set up. Run `/review` before pushing, `/commit` to commit, `/wrapup` to close out."

$ARGUMENTS
