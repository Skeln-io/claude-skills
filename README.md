# Skillkit: A Complete AI Development System

Skillkit is an open-source, template repo that gives you a fully configured Claude Code working environment in one command. Skills, hooks, specialist agents, CI templates, and a personal project manager — scaffolded into your project and ready to use.

## Why This Exists

Most developers using Claude Code start from scratch every session. No quality gates, no commit conventions, no design review, no structure. They rely on memory and discipline to stay productive.

This repo replaces discipline with automation. It's the system that runs behind a real production codebase — extracted, generalized, and made brand-configurable so anyone can use it.

*"The skills that keep me shipping, packaged so my clients can ship too."* — Simon Gardner, [Growth by Gardner](https://growthbygardner.com)

## What's Inside

**Development Workflow** — `/commit` creates conventional commits with smart staging. `/review` runs your build, lint, and dispatches specialist agents (TypeScript reviewer, UI designer) before allowing a push. A pre-push hook enforces this — no push without review.

**Personal Project Manager (PPM)** — Always-on behavior layer. Catches scope creep, detects context loss, enforces verification before claiming "done", and gives you the single smallest next action when you're stuck. Configurable to your working style.

**Brand-Aware Content** — `/copy` writes direct response copy using Hopkins, Ogilvy, and Caples frameworks, tuned to your brand voice. `/frontend-eval` audits components against your design system. `/press` writes press releases in DE, US, or UK format. All read from a single brand config file.

**Marketing & Analytics** — `/seo` runs a full 16-sub-skill audit with 10 specialist agents. `/google-ads` provides GAQL query patterns with mutation safety (no changes without explicit confirmation).

**Session Management** — `/wrapup` commits, pushes, and optionally posts a Slack summary. Auto-format hooks run Prettier (or Black for Python) on every file edit. Session-start hooks inject date, branch, and git status.

**Multi-Tenant Support** — Agencies can run every skill for multiple client brands. Each brand gets its own config file. No "active brand" state to get confused by — explicit selection every time.

## Quick Start

### CLI (one command)

```bash
gh repo create my-project --template Skeln-io/skillkit --public --clone && cd my-project && claude
```

Then run `/setup` when Claude Code opens. It asks 2-3 questions and scaffolds everything.

### GitHub UI

1. Click **"Use this template"** at the top of this page
2. Clone your new repo locally
3. Run `claude` in the project directory
4. Type `/setup`

## Prerequisites

1. [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
2. [Superpowers plugin](https://github.com/claude-plugins-official/superpowers) — required for brainstorming, planning, TDD, and debugging workflows:
   ```bash
   claude config edit
   # Add: "superpowers@claude-plugins-official": true to enabledPlugins
   ```

## Skills Reference

| Command | What it does | Brand-aware? |
|---|---|---|
| `/setup` | First-run scaffolding — skills, hooks, agents, config | — |
| `/setup brand` | Add a new brand for multi-tenant use | — |
| `/commit` | Conventional commits with smart staging | No |
| `/review` | Build + lint + specialist agent review, blocks push | No |
| `/wrapup` | Session closeout: commit, push, optional Slack | Yes |
| `/copy` | Direct response copywriting | Yes |
| `/frontend-eval` | Frontend design audit and redesign | Yes |
| `/seo` | Full SEO audit (16 sub-skills, 10 agents) | No |
| `/press` | Press release writing (DE/US/UK) | Yes |
| `/google-ads` | Google Ads queries and GAQL patterns | No |

**PPM** runs automatically — not a slash command.

## How It Works

**Brand config** lives in `config/brands/`. One markdown file per brand with voice, ICP, design tokens, dev commands, and integrations. Brand-aware skills read from here automatically.

**Hooks** enforce quality without thinking about it:
- `session-start.sh` — injects date, branch, git status
- `pre-push-check.sh` — blocks push until `/review` passes
- `format-file.sh` — auto-formats on every file edit
- `auto-checkpoint.sh` — commits config changes on session end

**Specialist agents** are dispatched by `/review`:
- `typescript-pro` — type safety, API contracts, build health
- `ui-designer` — visual hierarchy, accessibility, responsive behavior, brand alignment

## Customizing

- Delete any skill folder you don't need
- Edit hooks to match your formatter or toolchain
- Modify `config/profile.md` to tune PPM to your working style
- Add brands with `/setup brand`

## Built With

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — the runtime
- [Superpowers plugin](https://github.com/claude-plugins-official/superpowers) — brainstorming, planning, TDD, debugging
- Bash hooks, GitHub Actions, Markdown skills

## License

MIT
