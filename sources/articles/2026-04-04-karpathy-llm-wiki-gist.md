---
url: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
fetched_at: 2026-04-26 18:30
publish_date: 2026-04-04
title: "llm-wiki"
author: "Andrej Karpathy"
---

# llm-wiki (Karpathy gist)

> Source: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
> Created: 2026-04-04. 5,000+ stars / forks. 660+ comments.

## TL;DR

Karpathy proposes **persistent, LLM-maintained knowledge bases** instead of stateless RAG. The LLM reads new sources, integrates them into a structured markdown wiki, and updates entity / concept pages as knowledge accumulates.

## Compiled into wiki

- [[Karpathy LLM Wiki]] (concept) — created (this project IS one)
- [[Andrej Karpathy]] (person) — created

## Three-layer architecture (verbatim from gist)

1. **Raw Sources** — immutable documents (articles, papers, PDFs). Human-curated; LLM read-only.
2. **The Wiki** — markdown files owned entirely by the LLM. Summaries, entity pages, concept pages, cross-references.
3. **The Schema** — config doc (e.g. `CLAUDE.md`) defining wiki structure, conventions, workflows.

## Core operations

- **Ingest** — drop a source; LLM reads, discusses takeaways, writes summary, updates 10–15 wiki pages.
- **Query** — ask questions; LLM searches relevant pages, synthesizes answers, optionally files new pages.
- **Lint** — periodic health checks for contradictions, orphan pages, missing cross-references, gaps.

## Why it matters (Karpathy's framing)

> "Most people's experience with LLMs and documents looks like RAG… the LLM is rediscovering knowledge from scratch on every question. There's no accumulation."

The pattern solves a **persistence problem**: knowledge **compounds**, synthesis effort is done once not repeatedly.

## Tools / extensions Karpathy mentions

- Obsidian for browsing
- `index.md` — content-oriented catalog
- `log.md` — append-only activity record
- Optional: qmd (local search), Web Clipper, Dataview, Marp (slides)

## Critical commentary in thread (660+ comments)

- **@gnusupport** — "wiki" is a misnomer; real wikis have human consensus + provenance, LLM outputs lack these
- **@SEO-Warlord** — Zettelkasten (immutable atomic notes with stable IDs) handles knowledge integrity better than mutable wiki pages
- **@redmizt** — counters that gatekeeping the term ignores language evolution

## Risk Karpathy implicitly accepts

> Silent hallucination corruption if the LLM reads and rewrites its own outputs iteratively without audit trails or human validation gates.

This project guards against it via append-only `LOG.md`, weekly `/lint`, and per-claim source citation in front-matter.

## Implementations referenced in comments

NicholasSpisak/second-brain, Ar9av/obsidian-wiki, Synthadoc, claude-obsidian, llmwiki-cli, sparks. Most retain the three-layer pattern with added guardrails.
