---
description: Drain inbox/ — classify each free note (URL / question / thought) and route to the right command (ingest / ask / scan / wiki dissolve). Logs every action.
---

You are the librarian. Drain `inbox/`.

## What's in `inbox/`

- `inbox/_daily/` — automated scan digests. **Skip during /inbox.** They're processed when the user picks URLs out of them and creates new inbox notes.
- `inbox/<anything>.md` — **user free notes**. Each file is one item: a URL, a question, a thought, or a paste. Filename is whatever the user picked; classification is by content.

## Classifying each free note

Read the file. Decide what it is by content sniff (in order):

1. **YouTube URL** as the only or first non-blank line (`youtube.com/watch?v=…` or `youtu.be/…`):
   - Slug the title (or the URL ID) → `slug=YYYY-MM-DD-<short-slug>`
   - Run `.claude/scripts/yt-transcript.sh "<url>" "sources/videos/<slug>"` — captures captions or falls back to local whisper
   - Hand off to `/ingest` with the produced `sources/videos/<slug>.transcript.txt`. The /ingest pass writes the merged md (front-matter + curated digest + transcript inline) and deletes the .transcript.txt sidecar.
   - Move the inbox file to `inbox/_processed/` (create if missing) so it's gone from the active list but auditable.

2. **Other URL** (article, blog post, gist, etc.):
   - Run `/ingest <url>` directly. Writes to `sources/articles/`.
   - Move the inbox file to `inbox/_processed/`.

3. **Question** — file body starts with `# Question:` or `?` or the first sentence ends with `?` and is clearly a research prompt:
   - If the wiki likely has an answer → run `/ask <question>`, save the answer back into the inbox file under `## Answer`, leave it for the user to review.
   - If the wiki probably doesn't have an answer → suggest `/scan <topic>` in the end-of-session report; leave the file in place.

4. **Free-form thought / paste** — prose, lessons learned, half-baked idea:
   - If it cleanly belongs to one existing wiki page → dissolve it: edit that page to incorporate the thought, then move the inbox file to `inbox/_processed/`.
   - If it's source material worth keeping verbatim → save to `sources/articles/YYYY-MM-DD-slug.md` with `url: pasted` in front-matter, then run `/ingest` on it.
   - If it's neither (vague, no clear home) → leave in `inbox/`, surface in the end-of-session report.

5. **Unclear** → leave in place, list in report.

## Logging

One LOG.md line per inbox file processed:
```
- YYYY-MM-DD HH:MM | /inbox | <filename> → <route>: <target> | N pages | session-id
```

For YouTube routes, append `| transcript: captions|whisper|failed`.

## Budget

- If you'd touch >15 wiki pages total in one drain, stop after 15 and ask whether to continue.
- Don't refactor unrelated pages. That's `/lint`'s job.

## End of session

Print to chat:
- N items processed, broken down by route (ingest video / ingest article / ask / dissolve / left for review)
- Pages touched
- LOG lines written
- Anything left for user input
