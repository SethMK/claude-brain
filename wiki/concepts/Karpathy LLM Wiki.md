---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-04-karpathy-llm-wiki-gist]]"]
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

## Risks

- **Silent hallucination corruption** if the LLM rewrites its own pages iteratively without audit trails
- **"Wiki" naming** is contested — real wikis have human consensus + provenance; LLM-maintained pages don't (per critic comments on the gist)

## How this project guards against the risks

- `LOG.md` is append-only — full audit trail
- Weekly `/lint` surfaces drift
- Every wiki claim cites a source via front-matter
- "Balanced autonomy": LLM writes freely, user reviews weekly

## See also

- [[Andrej Karpathy]] · [[CLAUDE-md|CLAUDE.md]] · [[Claude Code]]
- Source: [[2026-04-04-karpathy-llm-wiki-gist]]
