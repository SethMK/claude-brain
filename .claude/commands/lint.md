---
description: Wiki health check — orphans, broken wikilinks, stale stubs, contradictions, and suggested next research. Reports only; does not auto-fix.
---

You are the librarian doing a weekly health check. **Report only — do not fix anything automatically.**

## Checks

1. **Orphans** — wiki pages with zero incoming `[[wikilinks]]`.
2. **Broken links** — `[[X]]` whose target page doesn't exist.
3. **Stale stubs** — pages with `status: stub` and `last_updated` >14 days old.
4. **Contradictions** — pages that disagree on the same fact (skim same-topic clusters).
5. **Gaps** — `[[X]]` referenced ≥3 times but X doesn't exist yet.
6. **Suggested next research** — 3 concrete URLs or topics that would fill the biggest gaps.

## How to scan

Use `Bash` with `grep -r '\[\[' wiki/` and similar. Build a small in-memory graph (mental, not literal). Don't over-engineer — this is a one-shot scan.

## Output

A markdown report in chat with sections matching the checks above. End with:
- **Top 3 fixes** — what you'd recommend doing first.
- **Top 3 research suggestions** — concrete next URLs to `/ingest`.

## Log

One line to `LOG.md`:
```
- YYYY-MM-DD HH:MM | /lint | <N> orphans, <N> broken, <N> stubs, <N> gaps. Top fix: <X>. | 0 pages | session-id
```

Don't fix anything. The user reviews the report and decides.
