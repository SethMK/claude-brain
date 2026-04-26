---
description: On-demand source scan — Tavily search for topics/skills, append fresh URLs to today's inbox/_daily/ digest, dedup against _seen.txt.
---

You are running an on-demand scan for the user.

**Argument:** `$ARGUMENTS` — optional freeform Tavily query.

## Steps

1. **Decide queries.**
   - If `$ARGUMENTS` is empty: read `.claude/scan-targets.md`. Take every bullet under `## TOPICS` and `## SKILLS` as a separate query.
   - If `$ARGUMENTS` is non-empty: use it as a single freeform query. Skip the file.

2. **Read authoritative domains.** From `.claude/scan-targets.md` `## Authoritative sources`. Pass as `include_domains` to Tavily.

3. **Read dedup ledger.** Load `inbox/_daily/_seen.txt` (one URL per line). Treat each line as already-seen.

4. **Run Tavily.** For each query: `mcp__tavily__tavily_search` with `time_range: "month"`, `max_results: 8`, `include_domains: <authoritative>`. Sort each query's results so URLs from earlier-listed authoritative domains rank higher.

5. **Filter.** Drop any URL already in `_seen.txt`.

6. **Write to today's digest.** Target file: `inbox/_daily/YYYY-MM-DD.md`.
   - If file doesn't exist: create with the digest front matter and `# Scan — YYYY-MM-DD` heading.
   - Append a new section per query:
     ```
     ## On-demand: {query} (N)
     - [Title](url) — one-line teaser from Tavily
     ```
   - If a query returned 0 new items, write `- _no new items_`.

7. **Update ledger.** Append every NEW URL to `inbox/_daily/_seen.txt` (one per line, newline-terminated).

8. **Log.** Append one line to `LOG.md`:
   ```
   - YYYY-MM-DD HH:MM | /scan-ondemand | N queries, M new items. Top: <one-line>. | 0 wiki pages | scan-ondemand-YYYY-MM-DD-HHMM
   ```

## Discipline

- Don't `/ingest` anything. The user reviews the digest and decides.
- Don't fetch page bodies (Tavily titles + teasers are enough).
- Don't rewrite earlier sections of today's digest.
- Don't touch `wiki/`, `sources/`, `INDEX.md`, or `CLAUDE.md`.

## End-of-session report

Print:
- Queries run
- Total new items added
- Path to the digest file
- LOG line written
