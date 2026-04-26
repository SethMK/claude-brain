---
description: Fetch a source (URL or path), save it under sources/, and compile into wiki/ — touching 3-15 pages with backlinks. Logs every action.
---

You are the librarian. The user is calling `/ingest`.

**Argument:** $ARGUMENTS — a URL, a file path, or pasted text.

## Steps

1. **Fetch.** If URL: `WebFetch` first; if blocked/heavy, fall back to `mcp__tavily__tavily_extract`. If path: `Read`. If pasted text: use as-is.
1.5. **YouTube transcript** (URL only). If the URL matches `youtube.com/watch` or `youtu.be/`:
   - Run `.claude/scripts/yt-transcript.sh "<url>" "sources/videos/YYYY-MM-DD-slug"`. The script prints `captions` or `whisper` to stdout — capture this.
   - Read the produced `sources/videos/YYYY-MM-DD-slug.transcript.txt` — that's the **authoritative content** for entity extraction in Step 3 (override anything WebFetch/Tavily returned for the body).
   - In Step 2, write the source to `sources/videos/YYYY-MM-DD-slug.md` (NOT `articles/`) and **embed the full transcript inline** under a `## Transcript` heading at the bottom. Then delete the `.transcript.txt` sidecar — the md is the only artifact.
   - Add `transcript_source: captions | whisper` (or `failed` if the script exited non-zero) to the front-matter.
   - If the script fails (exit ≠ 0): note `transcript_source: failed` and proceed with a metadata-only stub. Don't retry the script.
2. **File the raw.** Path depends on type:
   - **YouTube video** → `sources/videos/YYYY-MM-DD-slug.md` (one file, frontmatter + curated digest + full transcript inline)
   - **Text article / gist / blog post** → `sources/articles/YYYY-MM-DD-slug.md`
   - **Image** → `sources/screenshots/YYYY-MM-DD-slug.<ext>`

   Front-matter:
   ```yaml
   ---
   url: <original url or "pasted">
   fetched_at: YYYY-MM-DD HH:MM
   title: <source title>
   transcript_source: captions | whisper | failed | n/a   # YouTube only; omit otherwise
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
   For YouTube sources, append the transcript path used: `… | transcript: captions | …` (or `whisper` / `failed`).
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
