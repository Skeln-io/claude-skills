# Claude Skills — Your AI Development System

A complete Claude Code working system: skills, hooks, specialist agents, and CI templates. **Use the green "Use this template" button** to create your own copy, then run `/setup` to scaffold everything into your project.

## Prerequisites

1. [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
2. Superpowers plugin installed:
   - Open Claude Code settings: `claude config edit`
   - Add to `enabledPlugins`: `"superpowers@claude-plugins-official": true`

## Quick Start

### CLI (one command)

```bash
gh repo create my-project --template Skeln-io/claude-skills --public --clone && cd my-project && claude
```

Then run `/setup` when Claude Code opens.

### GitHub UI

1. Click **"Use this template"** → **"Create a new repository"** (top of this page)
2. Clone your new repo locally
3. Open your project in Claude Code
4. Run `/setup`
5. Follow the prompts — it scaffolds skills, hooks, and config into your project

## Skills

| Command | What it does | Brand-aware? |
|---|---|---|
| `/setup` | First-run scaffolding — sets up skills, hooks, agents, config | — |
| `/setup brand` | Add a new brand config for multi-tenant use | — |
| `/commit` | Conventional commits with smart staging | No |
| `/review` | Build + lint + specialist agent review, blocks push until clean | No |
| `/wrapup` | End-of-session: commit, push, optional Slack summary | Yes |
| `/copy` | Direct response copywriting using proven frameworks | Yes |
| `/frontend-eval` | Frontend design audit and redesign guidance | Yes |
| `/seo` | Full SEO audit (16 sub-skills) | No |
| `/press` | Press release writing (DE/US/UK format) | Yes |
| `/google-ads` | Google Ads query guide and GAQL patterns | No |

**PPM (Personal Project Manager)** is always-on — it's not a slash command. It watches for context loss, scope creep, and keeps you shipping.

## Adding a Brand

For agencies or multi-project setups:

1. Run `/setup brand` in Claude Code
2. Answer 2-3 questions about the brand
3. A new config file appears in `config/brands/`

Brand-aware skills automatically read from the active brand config.

## Customizing

- **Don't need a skill?** Delete its folder from `.claude/skills/`
- **Want to change a hook?** Edit the `.sh` files in `.claude/hooks/`
- **Different formatter?** Update `format-file.sh` to call your formatter
- **No Slack?** Leave the webhook blank in brand config — wrapup skips it

## Dependencies

| Dependency | Required? | Why |
|---|---|---|
| Claude Code CLI | Yes | The runtime |
| superpowers plugin | Yes | Brainstorming, planning, TDD, debugging |
| Node.js | For JS/TS projects | Build/lint/format hooks |
| Prettier | Optional | Auto-format hook, skips if not installed |
| Slack webhook | Optional | Wrapup posts, skips if not configured |
| GitHub Actions | Optional | CI templates |

## License

MIT
