---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-04-karpathy-llm-wiki-gist]]", "[[2026-04-25-wanderloots-why-llm-wiki]]", "[[2026-04-16-tutak-obsidian-claude-code]]"]
---

# Karpathy LLM Wiki

## What it is

A pattern, proposed by [[Andrej Karpathy]] in April 2026, for **persistent LLM-maintained knowledge bases**. Instead of using LLMs to retrieve documents on demand (RAG), you feed them a stream of sources and the LLM compiles + cross-links + maintains a markdown wiki that **knowledge accumulates in**.

This project (Claude Brain) is one such wiki. The pattern is the spec; this folder is the implementation.

## Three-layer architecture

1. **Raw Sources** (`sources/`) — immutable documents. LLM reads, never writes.
2. **The Wiki** (`wiki/`) — markdown files the LLM owns entirely.
3. **The Schema** ([[CLAUDE-md|CLAUDE.md]]) — config that turns the LLM into a disciplined librarian.

## Core operations

- **Ingest** — drop a source → LLM reads → updates 10-15 wiki pages
- **Query** — ask question → LLM reads relevant pages + synthesizes
- **Lint** — periodic checks for orphans, broken links, contradictions, gaps

## Why it works (vs RAG)

> "There's no accumulation." — Karpathy on RAG

RAG re-derives knowledge per query. The wiki **compiles once**. Synthesis effort isn't repeated. The wiki itself becomes a personal artefact you can grep, share, version-control, and use across LLMs.

The pattern is really an LLM-maintained [[Knowledge graph]]. The graph framing predates Karpathy's gist by years in the PKM community — Karpathy's contribution was making it viral and pairing it with [[Claude Code]] as the maintenance agent [[2026-04-25-wanderloots-why-llm-wiki]]. The "memory layer survives across LLMs" pitch — vendor-neutral markdown you keep when you switch tools — is the strongest non-dev case for the pattern.

## Risks

- **Silent hallucination corruption** if the LLM rewrites its own pages iteratively without audit trails
- **"Wiki" naming** is contested — real wikis have human consensus + provenance; LLM-maintained pages don't (per critic comments on the gist)

## How this project guards against the risks

- `LOG.md` is append-only — full audit trail
- Weekly `/lint` surfaces drift
- Every wiki claim cites a source via front-matter
- "Balanced autonomy": LLM writes freely, user reviews weekly

## Community treatments

The pattern has been picked up beyond Karpathy's gist. Examples in this wiki:

- [[2026-04-16-tutak-obsidian-claude-code]] — [[Krzysztof Tutak]] + [[Krzysztof Błohaczek]]'s Polish-language AI Ninjas workshop (Apr 2026) frames the pattern via the [[Second Brain]] concept first, then Karpathy's wiki as the implementation. Notable for the most productionised pipeline I've seen — see "Auto-ingest pipeline" below.
- [[2026-04-25-wanderloots-why-llm-wiki]] — frames it as an LLM-maintained [[Knowledge graph]] for PKM users. Introduces a **two-vault variant** (separate human vault and LLM vault) as a design choice.

## Auto-ingest pipeline (Tutak's variant)

The bare Karpathy pattern is manual: drop file → run `/ingest`. Tutak's [[2026-04-16-tutak-obsidian-claude-code|AI Ninjas workshop]] demos a fully automated pipeline worth knowing about even if we don't adopt all of it:

- **File-system watcher** (PowerShell) on `row/videos/`, `row/articles/` etc. — new file triggers preprocessing.
- **Zero-token preprocessing**: yt-dlp captions (or yt-dlp audio → local Whisper Large) for video; GLM OCR for images. None of this hits API tokens.
- **`session start` hook as cron** — daily at 23:00, Claude Code runs the wiki-compile pass on everything new since yesterday. The user "just sits down in the morning and the wiki is current."
- **`/daily` custom command** — outputs a daily digest of new notes to read.

Claude Brain currently has the [yt-transcript.sh](../../.claude/scripts/yt-transcript.sh) piece (added 2026-04-26 as `ingest-005`). The watcher + cron-hook are open questions worth raising at next `/lint` if the manual cadence becomes the bottleneck.

## See also

- [[Andrej Karpathy]] · [[CLAUDE-md|CLAUDE.md]] · [[Claude Code]] · [[Obsidian]] · [[Second Brain]] · [[Knowledge graph]] · [[Wanderloots]] · [[Krzysztof Tutak]] · [[Krzysztof Błohaczek]]
- Sources: [[2026-04-04-karpathy-llm-wiki-gist]] · [[2026-04-25-wanderloots-why-llm-wiki]] · [[2026-04-16-tutak-obsidian-claude-code]]
