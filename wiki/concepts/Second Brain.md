---
type: concept
status: stub
last_updated: 2026-04-26
sources: ["[[2026-04-16-tutak-obsidian-claude-code]]"]
---

# Second Brain

## What it is

A personal, persistent, externalised knowledge store — notes, references, and synthesis you've captured over time — that you can query and build on instead of starting from blank context every time. The term predates LLMs (Tiago Forte's "Building a Second Brain" methodology, popularised mid-2010s), but **the LLM era is what made it actually useful**: an LLM can now read and maintain it for you.

## How it relates to this wiki

The [[Karpathy LLM Wiki]] pattern is one specific way of building a Second Brain optimised for LLM consumption:

- **Without LLM:** Second Brain = your personal knowledge garden you read and curate manually
- **With LLM:** Second Brain = something the LLM **reads, writes, and queries** on your behalf, so you stop being its bottleneck

Krzysztof Tutak's 2026-04-16 stream uses "Second Brain" as the framing motivation before introducing Karpathy's LLM Wiki as the technical implementation — a useful order: explain the goal first, then the mechanism. ([[2026-04-16-tutak-obsidian-claude-code]])

## When to use the term

- Talking to non-devs / PMs / researchers — "Second Brain" lands faster than "LLM Wiki"
- Framing the *why* (memory across sessions) before the *how* (markdown + ingest commands)

## When not to

- When precision matters: a Second Brain doesn't have to be LLM-readable, and an LLM Wiki is opinionated about *how* the brain is structured. Use the more specific term inside this project.

## Gotchas

- The "memory problem of AI assistants" is the bridge: every LLM session starts cold unless you give it a Second Brain to read. This is the chapter Tutak titles "Problem z pamięcią asystentów AI".
- A Second Brain is only as good as your **capture discipline**. Without an inbox + ingest workflow, it rots.

## See also

- [[Karpathy LLM Wiki]] — opinionated implementation pattern
- [[Obsidian]] — common storage choice · [[Claude Code]] — common librarian
- [[CLAUDE-md|CLAUDE.md]] — what turns the brain into a *librarian-able* brain
