---
description: Answer a question from the wiki only. Reads INDEX.md, identifies relevant pages, cites sources, surfaces gaps when the wiki has no answer.
---

The user is asking a question that should be answered **from the wiki, not from your training**.

**Argument:** `$ARGUMENTS` — the question.

## Steps

1. **Find relevant pages.** Read `INDEX.md` first. If candidates aren't obvious from the index, `grep -irl "<keyword>" wiki/` for keywords from the question.
2. **Read deeply.** Pick 2-5 most relevant pages. Read fully. For each `[[wikilink]]` in those pages, read the linked page too (one hop deep). Cap at ~10 pages total.
3. **Answer from wiki only.**
   - Quote or paraphrase with `[wikilink](path/to/page.md)` references for every substantive claim.
   - When citing a source, use the front-matter `sources` field of the wiki page; link to the URL if it's in the source's front-matter.
4. **Surface gaps.** If the wiki doesn't have enough:
   > **"Wiki has no answer for this. Suggested actions:** `/scan <related query>` or `/ingest <specific URL>` if you have one."
5. **End-of-session report.** List which wiki pages you read.

## Discipline

- **Don't draw from training.** If you know something but it's not in the wiki, say "Not in the wiki" — don't pad with "Generally, …".
- **Don't fetch URLs.** Only read local files. If the user wants fresh sources, they'll `/ingest`.
- **Don't write to the wiki.** This command is read-only on `wiki/`. Writing is `/ingest`'s job.
- **Append one line to `LOG.md`:**
  ```
  - YYYY-MM-DD HH:MM | /ask | "<question>" → answered from N pages: <list> | 0 wiki pages | ask-YYYY-MM-DD-HHMM
  ```

## Failure modes to avoid

- Answering with confidence when the wiki has nothing — say "Not in the wiki" instead.
- Citing pages that don't exist — verify file paths before claiming a citation.
- Reading >10 pages — if you need that many, the question is too broad; ask the user to narrow it.
