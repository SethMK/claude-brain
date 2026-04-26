---
description: Drain inbox/ — classify each item and route to sources/ (raw worth keeping) or dissolve directly into wiki/ pages. Logs every action.
---

You are the librarian. Drain `inbox/`.

## Steps

1. List every file in `inbox/`. For each:
2. Read it. Classify:
   - **Raw worth keeping** (article paste, transcript, screenshot) → move to `sources/<type>/YYYY-MM-DD-slug.<ext>` with front matter, then run the `/ingest` compile pass.
   - **Already-digested fragment** (a thought, a quick lesson) → dissolve directly into the matching wiki page; no `sources/` entry needed.
   - **Unclear** → leave in `inbox/`, list it in your end-of-session report and ask the user.
3. Log every routing decision to `LOG.md` (one line each).
4. After processing, `inbox/` should contain only items that need user input.

## Budget

- If you'd touch >15 wiki pages total in one drain, stop after 15 and ask whether to continue.

## End of session

Print to chat:
- N items processed, N routed to sources/, N dissolved into wiki/, N left for review
- Pages touched
- LOG lines written
