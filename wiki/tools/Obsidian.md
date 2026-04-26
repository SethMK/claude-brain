---
type: tool
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-25-wanderloots-why-llm-wiki]]", "[[2026-04-04-karpathy-llm-wiki-gist]]", "[[2026-04-16-tutak-obsidian-claude-code]]"]
---

# Obsidian

## What it is

A local-first markdown editor with native `[[wikilinks]]`, backlinks, tags, and a graph view. Files live as plain `.md` on disk in a folder Obsidian calls a **vault**. Docs: https://obsidian.md.

The canonical IDE for the [[Karpathy LLM Wiki]] pattern. Karpathy's framing: *"Obsidian is the IDE, the LLM is the programmer, the wiki is the codebase."* [[2026-04-04-karpathy-llm-wiki-gist]]

## How I use it

This project's `wiki/` folder is an Obsidian vault. The LLM (Claude, via [[Claude Code]]) writes the markdown; Obsidian is the **viewer + occasional manual editor**. Day-to-day:

- Open the vault to read pages, traverse `[[wikilinks]]`, scan the graph view.
- Use **Web Clipper** browser extension to one-click-save articles into `sources/` as markdown.
- Rarely edit pages by hand — that's what `/ingest` and `/lint` are for.

Marcin (PM/researcher) is the target user — the appeal is **plain-text portability + zero lock-in**, not the dev features.

## Setup

- Install Obsidian (free, desktop).
- Open the project root (`202604_Claude_Brain/`) as the vault, or open `wiki/` directly — both work since [[CLAUDE-md|CLAUDE.md]] points the LLM at the right paths regardless.
- Install **Obsidian Web Clipper** (Chrome/Firefox/Safari) for the manual-source path. Articles save as `.md` with front-matter; you choose the destination folder per save.
- Optionally install community plugins (Bases, Dataview) — out of scope for now.

The "new note default location" is locked to a writable scratch folder so accidental Cmd+N notes don't pollute the wiki root.

## Limits

- **No native LLM integration** — Obsidian doesn't run the LLM. Claude Code or another agent runs alongside in the terminal; Obsidian just renders the result. This is by design (per Karpathy's IDE/programmer split) but means you're juggling two windows.
- **Graph view is decorative below ~50 nodes** [[2026-04-25-wanderloots-why-llm-wiki]] — don't expect insight from a 5-page vault.
- **Mobile sync is paid** (Obsidian Sync). Free alternative: iCloud / Dropbox / git on the vault folder.
- **Web Clipper extracts what's on the page** — paywalled / JS-heavy sites need Tavily fallback per [[CLAUDE-md|CLAUDE.md]] tool guidance.

## Polish-language treatment

[[Krzysztof Tutak]]'s 2026-04-16 livestream ([[2026-04-16-tutak-obsidian-claude-code]]) walks Polish-speaking PMs / no-coders through this exact stack — Obsidian + Claude Code as a [[Second Brain]], framed via Karpathy's wiki pattern. Useful pointer when explaining the project to Polish-speaking peers.

## See also

- [[Karpathy LLM Wiki]] — the pattern this tool serves
- [[Second Brain]] — the goal the pattern serves
- [[Knowledge graph]] — the artifact Obsidian renders
- [[Wanderloots]] — Obsidian creator who frames the graph/RAG trade-off for PKM users
- [[Krzysztof Tutak]] — Polish AI practitioner demonstrating the stack
- [[Claude Code]] — the "programmer" half of Karpathy's IDE/programmer split
