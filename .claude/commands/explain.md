---
description: Read recent LOG.md entries and explain in plain English what Claude did and why.
---

The user wants to know what's been happening in the wiki.

## Steps

1. Read the last 20 lines of `LOG.md` (or the full session if `$ARGUMENTS` is a session-id).
2. For any session-id with a detailed log in `wiki/_log/`, read that too.
3. Write a plain-English summary in chat:
   - **What happened** — the operations Claude ran, in order.
   - **Why** — the user request or trigger that started each.
   - **What changed** — pages created vs updated, with `[wikilink](path)` so the user can click.
   - **Anything to look at** — surfacing decisions you weren't sure about, or things flagged in `/lint`.
4. Keep it under 200 words unless the user asks for more.

Do not modify any files. This is read-only.
