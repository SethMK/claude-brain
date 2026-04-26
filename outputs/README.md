# Outputs

Drafts generated from the wiki via `/draft <type> <topic>`. Each file is **a draft you review and ship**, not the librarian's domain.

Types:
- `post` — Slack / LinkedIn (200-400 words)
- `brief` — decision one-pager
- `workshop` — teaching outline (30-60 min)

Naming: `YYYY-MM-DD-<type>-<slug>.md`. Front-matter has `wiki_sources` so you can trace claims back.

When you ship a draft, change `status: draft` → `status: shipped` in front-matter. Optional but useful for `/lint` to surface stale drafts later.
