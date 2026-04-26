# Claude Brain

A self-maintained wiki about Claude (Code, API, Cowork, ecosystem) for a non-developer / PM / researcher.

Pattern: [Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) (April 2026).

## Mental model

> Obsidian is the IDE. Claude is the programmer. The wiki is the codebase.

Three layers, never blurred:
- `inbox/` — drop zone (you fill it)
- `sources/` — immutable raw material (Claude reads, never edits)
- `wiki/` — the knowledge base (Claude owns it)

## How you use it

1. Drop a URL into chat or run `/ingest <url>`. Claude fetches it, files it under `sources/`, and compiles 3-15 wiki pages.
2. Drop quick notes into `inbox/`. Run `/inbox` to drain.
3. Read `LOG.md` any time to see what Claude did.
4. Run `/lint` weekly — health check, gap analysis, suggested next research.
5. Ask `/explain` if you don't understand a recent change.

## Slash commands

| Command | What it does |
|---|---|
| `/ingest <url-or-path>` | Fetch a source, file it, compile into wiki |
| `/inbox` | Drain `inbox/` — classify and route every item |
| `/lint` | Wiki health check (orphans, broken links, gaps) |
| `/explain` | Plain-English summary of recent LOG.md entries |

## Why this works

- **Markdown only** — Obsidian, VS Code, GitHub, grep, future-LLM all read it.
- **Append-only LOG.md** — you can always answer "what just happened?"
- **Wikilinks `[[X]]`** — Obsidian renders them; Claude maintains them.
- **Schema in [CLAUDE.md](CLAUDE.md)** — that file is the agent's instructions.

## First time?

Open this folder in Obsidian. Then read [CLAUDE.md](CLAUDE.md) and try:
```
/ingest https://docs.claude.com/en/docs/claude-code/skills
```
