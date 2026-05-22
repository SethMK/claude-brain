# Claude Brain

<img width="902" height="655" alt="Screenshot 2026-05-22 at 15 59 51" src="https://github.com/user-attachments/assets/45203120-822f-4bf7-84fe-af9700548cc9" />

A self-maintained wiki about the Claude ecosystem (Claude Code, Claude API, Claude Cowork, agents, MCP servers, skills) — built by a **non-developer PM / researcher**, owned by Claude itself.

Pattern adapted from [Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) (April 2026).

## Mental model

> Obsidian is the IDE. Claude is the programmer. The wiki is the codebase.

Three layers, never blurred:

| Layer | Who writes | What lives there |
|---|---|---|
| `inbox/` | Human drop zone | Quick notes, raw URLs, half-formed thoughts |
| `sources/` | Claude (append-only) | Immutable raw material — fetched articles, transcripts, docs |
| `wiki/` | Claude (full ownership) | Curated, backlinked, schema-conformant knowledge pages |

Layer separation is enforced by the agent contract — `sources/` is never rewritten, `wiki/` is never hand-edited, `inbox/` empties on every drain.

## Daily flow

1. Drop a URL in chat or run `/ingest <url>`. Claude fetches it, files under `sources/`, compiles 3-15 wiki pages with backlinks.
2. Drop quick notes into `inbox/`. Run `/inbox` to classify + route every item.
3. Read `LOG.md` (append-only) any time to see what Claude did.
4. Run `/lint` weekly — orphan detection, broken-link audit, gap analysis, suggested next research.
5. Run `/explain` if you don't understand a recent change.

## Slash commands

| Command | What it does |
|---|---|
| `/ingest <url-or-path>` | Fetch a source, file it, compile into wiki |
| `/inbox` | Drain `inbox/` — classify and route every item |
| `/lint` | Wiki health check (orphans, broken links, gaps) |
| `/explain` | Plain-English summary of recent LOG.md entries |

## Why this works

- **Markdown only** — Obsidian, VS Code, GitHub, grep, future LLM all read it. No vendor lock-in.
- **Append-only LOG.md** — always answers "what just happened?"
- **Wikilinks `[[X]]`** — Obsidian renders them, Claude maintains them, recruiters can read the graph.
- **Schema in CLAUDE.md** — that file is the agent's complete instruction set.
- **Layer separation is the contract** — prevents the "Claude rewrote my notes" failure mode common in LLM-curated wikis.

## What's in the wiki today

~100 curated pages across:

- Claude Code: skills, hooks, slash commands, MCP integration, agent SDKs
- Claude API: tool use, agent patterns, model selection, cost optimisation
- Claude Cowork: collaboration patterns, mobile, web
- MCP server ecosystem: cataloged ~30 production-grade servers + use-cases
- Agentic patterns: orchestration, hand-off, evaluation, verification

## Code

Wiki content lives in a private Obsidian vault. This public README documents the methodology + agent contract — the **architecture**, not the data.

Companion projects: [agenticos](https://github.com/SethMK/agenticos) (build) + [agentic-os-pmo](https://github.com/SethMK/agentic-os-pmo) (planning methodology).

---

Built by [Marcin Kokott](https://linkedin.com/in/marcinkokott) — Head of Product & Delivery, Vazco.
