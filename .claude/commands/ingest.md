---
description: Fetch a source (URL or path), save it under sources/, and compile into wiki/ — touching 3-15 pages with backlinks. Logs every action.
---

You are the librarian. The user is calling `/ingest`.

**Argument:** $ARGUMENTS — a URL, a file path, or pasted text.

## Steps

1. **Fetch.** If URL: `WebFetch` first; if blocked/heavy, fall back to `mcp__tavily__tavily_extract`. If path: `Read`. If pasted text: use as-is.
2. **File the raw.** Save to `sources/articles/YYYY-MM-DD-slug.md` with front matter:
   ```yaml
   ---
   url: <original url or "pasted">
   fetched_at: YYYY-MM-DD HH:MM
   title: <source title>
   ---
   ```
3. **Identify entities.** Read the source. Name the 1-3 main concepts/tools/workflows it covers.
4. **Compile.** For each entity:
   - Locate existing page in `wiki/concepts/`, `wiki/tools/`, or `wiki/workflows/`.
   - If exists: update it (add a section, refine, cite the new source).
   - If not: copy the matching template from `wiki/_templates/`, fill it in, cite.
5. **Cross-link.** Add `[[wikilinks]]` aggressively. Update reciprocal backlinks where natural.
6. **Update INDEX.md** if you added a top-level entity.
7. **Log.** Append one line to `LOG.md`:
   ```
   - YYYY-MM-DD HH:MM | /ingest | <one-line summary of source + main entity> | N pages | session-id
   ```
8. **Detailed log if >5 pages touched.** Write `wiki/_log/YYYY-MM-DD-slug.md` listing each page touched and what changed; reference it from the LOG line.

## Budget

- 3-15 pages per ingest. If you'd need more, **stop and ask the user**.
- Don't refactor unrelated pages. That's `/lint`'s job.

## End of session

Print to chat:
- What was ingested
- Pages touched (created vs updated)
- LOG line written
- Anything ambiguous the user should review
