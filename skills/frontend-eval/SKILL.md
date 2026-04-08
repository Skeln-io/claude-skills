---
name: frontend-eval
description: Frontend design evaluator — audit current components and guide redesigns using your brand's design system. Brand-aware — reads design tokens and aesthetic from brand config.
argument-hint: "[component or page to evaluate, e.g. 'product card' or 'homepage hero']"
---

# Frontend Design Evaluator

## Phase 1 — Evaluate (always run first)

Before touching any code, audit the current component or page using this rubric. Score each dimension 1-5. Write the scores and a one-sentence finding for each.

| Dimension | Score (1-5) | Finding |
|-----------|-------------|---------|
| **Visual hierarchy** | — | Is the primary action obvious? Does the eye go where it should? |
| **Brand alignment** | — | Does it match the brand aesthetic from config, or does it feel generic? |
| **CRO signals** | — | Trust, urgency, social proof, value prop clarity — what's missing? |
| **Typography quality** | — | Are fonts being used with intention? Sizing, weight, spacing? |
| **Spacing rhythm** | — | Consistent grid, breathing room, density matches the section's purpose? |
| **Conversion friction** | — | What would make a user bail before completing the action? |

After scoring, write:
- **3 specific weaknesses** (cite file + line number)
- **1 thing that's working well** (don't fix what isn't broken)
- **Redesign mandate** (one sentence: "This redesign should achieve X by doing Y")

Do not proceed to Phase 2 until this evaluation is complete and the user has confirmed the direction.

## Phase 2 — Redesign

### Load Design System

Read the brand config from `config/brands/` and extract:
- **Colors** (primary, secondary, accent with hex values)
- **Fonts** (heading, body)
- **Aesthetic** (the design philosophy)
- **Component patterns** (existing patterns to follow)

If no design tokens exist in config, ask:
1. "What's your primary brand color?"
2. "What's your design aesthetic in 3 words?"

### Design Principles (Universal)

These apply regardless of brand:
- **Hierarchy is king.** One dominant element per section. Never compete with the CTA.
- **Type does the heavy lifting.** Use the heading font aggressively for personality.
- **Space is not waste.** When in doubt, add padding.
- **Consistency over novelty.** Match existing patterns before inventing new ones.

### Implementation Constraints (Non-Negotiable)

**Preserve exactly — do not touch:**
- All analytics/tracking calls — move with the element if it moves, never remove
- All checkout and cart logic — visual-layer changes only
- All i18n hooks and translation keys — never hardcode copy
- All SEO-related server component structure (metadata, static params, etc.)

**Code standards:**
- Use the project's existing framework patterns (detect from codebase)
- Images: always use the framework's image component, never raw `<img>`
- Links: always use the framework's link component for internal routes
- No new npm packages unless absolutely necessary

### Output Format

For each component being redesigned:
1. State which Phase 1 weaknesses this addresses
2. Show the full replacement file (not a diff — full file so it can be dropped in)
3. Call out any translation keys that need adding
4. Run lint after writing and fix any errors before handing back

$ARGUMENTS
