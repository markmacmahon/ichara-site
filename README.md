# i-chara.com

Public website project for `i-chara.com`.

## Purpose

This repository hosts a concise historical archive page about i-Chara, including:

- factual context
- timeline summary
- source links
- preserved icon assets from archived material

## Project Structure

- `site/`
  - static website files served by GitHub Pages
- `site/index.html`
  - primary archive page
- `site/styles.css`
  - site styling
- `site/CNAME`
  - custom domain mapping (`i-chara.com`)
- `.github/workflows/pages.yml`
  - automatic GitHub Pages deployment workflow

## Local Preview

From repo root:

```bash
cd site
python3 -m http.server 8000
```

Then open:

- `http://localhost:8000`

## Deployment

Deployment is handled by GitHub Actions via `.github/workflows/pages.yml`.

On pushes to `main` that affect `site/**`, the workflow publishes the site to GitHub Pages.

## Notes

- Keep claims concise and evidence-linked.
- Prefer updating `index.html` directly for small factual corrections.
- Review rights/licensing before adding third-party media beyond archival reference use.
