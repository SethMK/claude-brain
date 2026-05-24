# Claude Brain — Agent Contract

This file is Claude's complete instruction set for maintaining the wiki.

## Layers

| Layer | Who writes | What lives there |
|---|---|---|
| `inbox/` | Human drop zone | Quick notes, raw URLs, half-formed thoughts |
| `sources/` | Claude (append-only) | Immutable raw material — fetched articles, transcripts, docs |
| `wiki/` | Claude (full ownership) | Curated, backlinked, schema-conformant knowledge pages |

## Rules

- `sources/` is never rewritten.
- `wiki/` is never hand-edited.
- `inbox/` empties on every drain.
- `LOG.md` is append-only.
- `INDEX.md` is auto-maintained by Claude.

## Wiki page schema

```yaml
---
title: <string>
tags: [<tag>, ...]
related: [[[page]], ...]
source: <url or sources/ path>
updated: YYYY-MM-DD
---
```

## Slash commands

| Command | What it does |
|---|---|
| `/ingest <url-or-path>` | Fetch a source, file it, compile into wiki |
| `/inbox` | Drain `inbox/` — classify and route every item |
| `/lint` | Wiki health check (orphans, broken links, gaps) |
| `/explain` | Plain-English summary of recent LOG.md entries |
| `/scan-daily` | Run daily broad scan and write digest |
