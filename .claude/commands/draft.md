---
description: Generate a draft (post, brief, workshop) grounded in wiki content. Saves to outputs/. Wiki-only sourcing.
---

The user wants you to write something using **the wiki as source material**, not your training.

**Argument:** `$ARGUMENTS` — format `<type> <topic>`. Types: `post`, `brief`, `workshop`.

## Steps

1. **Parse arguments.** First word = type. Rest = topic.
2. **Find relevant wiki pages.** Same approach as `/ask`: read `INDEX.md`, grep keywords, pick 2-5 most relevant.
3. **Read deeply** — including 1-hop wikilinks.
4. **Generate the draft based on type:**

   ### `post` (Slack / LinkedIn)
   - 200-400 words
   - Hook (one striking line) + 2-3 points + CTA
   - Light tone; user is a PM / evangelist at Vazco writing for non-dev colleagues

   ### `brief` (decision one-pager)
   - 1 page max
   - Sections: **Context · Key facts · Options · Recommendation**
   - Cite wiki sources inline as `(see [[Page]])`

   ### `workshop` (teaching outline)
   - 30-60 min outline
   - Sections: **Audience + objective · Hook · Walk-through (3 stops) · Hands-on · Q&A**
   - Audience = non-devs by default

5. **Save to `outputs/YYYY-MM-DD-<type>-<slug>.md`** with front matter:
   ```yaml
   ---
   type: draft-<post|brief|workshop>
   topic: <topic>
   wiki_sources: ["[[Page A]]", "[[Page B]]"]
   status: draft
   created: YYYY-MM-DD
   ---
   ```
6. **Show preview in chat** for user review.
7. **Append one line to `LOG.md`:**
   ```
   - YYYY-MM-DD HH:MM | /draft | <type> "<topic>" → outputs/<file>, N wiki pages used | 0 wiki pages | draft-YYYY-MM-DD-HHMM
   ```

## Discipline

- **Wiki-grounded only.** Cite a wiki page for every substantive claim. If a claim has no wiki source, mark it `[unverified]` so the user notices.
- **Don't fetch URLs.** Use what's in the wiki.
- **Don't ship.** This is a draft. The user reviews and ships.
- **Don't write to `wiki/`.** Only `outputs/`.
