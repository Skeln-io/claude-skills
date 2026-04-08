---
name: press
description: Press release writing — adapts format to market (DE/US/UK). Brand-aware — reads company info and boilerplate from brand config.
argument-hint: "[what the release is about]"
---

# Press Release

## Step 1 — Load Brand Context

Read the brand config from `config/brands/`. Extract:
- **Market** (DE, US, UK, etc.) — determines format
- **Brand name** and identity
- **Voice & Tone**

If brand config has a boilerplate file referenced, use it. Otherwise, write a 2-3 sentence company description from the brand identity section.

## Step 2 — Determine Format

### German Format (Market: DE)

```
PRESSEMITTEILUNG

[EMBARGO: TT.MM.JJJJ — or omit for immediate release]

HEADLINE — short, factual, verb-first where possible
Subheadline — one sentence expanding the headline (optional)

[City], [TT. Monat JJJJ]

LEAD PARAGRAPH
5 W's: Wer, Was, Wann, Wo, Warum. Max 3 sentences.

BODY (2-3 paragraphs, max 500 words total)

QUOTE
"Zitat." - Vorname Nachname, Titel, Unternehmen

UBER [UNTERNEHMEN] — Boilerplate (2-3 sentences)

KONTAKT
Name / Titel / E-Mail / Website

- Ende -
```

**German rules:**
- Third person throughout — never "Wir freuen uns", always "[Brand] freut sich"
- Date format: `26. Marz 2026`
- No superlatives, no exclamation marks

### English Format (Market: US/UK)

```
FOR IMMEDIATE RELEASE [or EMBARGOED UNTIL: Month DD, YYYY]

HEADLINE — short, factual, news-led

[City, State/Country] — [Month DD, YYYY]

LEAD PARAGRAPH
Who, What, When, Where, Why. Max 3 sentences.

BODY (2-3 paragraphs, max 500 words total)

QUOTE
"Quote." - First Last, Title, Company

ABOUT [COMPANY] — Boilerplate (2-3 sentences)

CONTACT
Name / Title / Email / Website

###
```

## Universal Rules

- **Lead with the one surprising fact** — if it's not in the first sentence, it won't be read
- **300-400 words is the sweet spot** — journalists get 100+ pitches/week
- **No marketing language** in headlines — factual and news-led
- **Quote must sound human** — if it reads like a CEO memo or AI output, rewrite it
- **One DIN A4 page max**

## Checklist Before Finalising

- [ ] Headline is factual, no hype words
- [ ] First sentence contains the surprising/concrete fact
- [ ] Lead answers all W's
- [ ] One quote, real person, with title
- [ ] Boilerplate from config (not rewritten)
- [ ] Correct date format for market
- [ ] Third person throughout (no "we", "our")
- [ ] Total length 300-400 words
- [ ] Contact block present

$ARGUMENTS
