# i-chara.com Editorial/Content Agent Guide

This repository hosts a small public archive website for i-chara.com.

## Objectives

- Keep content concise, factual, and source-linked.
- Preserve a neutral historical tone.
- Avoid hype and speculative over-claiming.
- Keep the site easy to maintain as a static project.

## Scope

Primary files:
- `site/index.html`
- `site/styles.css`
- `site/CNAME`
- `.github/workflows/pages.yml`

## Content Rules

1. Prefer short factual paragraphs over long narrative blocks.
2. Keep historical claims proportional to source confidence.
3. If a claim is inferential, signal it clearly (for example: "records suggest").
4. Keep outbound links current and relevant.
5. Do not mention unrelated repositories in website copy.

## Style Rules

- Use plain, direct language.
- No em dashes (`-`). Use a normal hyphen (`-`) when needed.
- Avoid marketing language.
- Keep headings descriptive and simple.

## Pre-Commit Checks

Run before commit:

```bash
./scripts/check-site-content.sh
```

This check enforces:
- no em dashes in tracked content files
- required website files exist
- no references to unrelated repo links in site pages

## Deployment

- Site deploys via GitHub Pages workflow from `main`.
- Keep `site/CNAME` set to `i-chara.com`.

## Change Logging

For significant edits, include in commit message:
- what content changed
- why it changed
- source impact (if any)
