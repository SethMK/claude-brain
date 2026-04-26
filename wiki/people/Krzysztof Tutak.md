---
type: person
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-16-tutak-obsidian-claude-code]]"]
---

# Krzysztof Tutak

## Role

Polish AI practitioner with **10+ years as a programmer**. Hosts the YouTube channel **Krzysztof Tutak** (~2.76K subscribers as of 2026-04-26), the **Bliskie Spotkania z AI** ("Close Encounters with AI") podcast, and organizes the **AI Miners** conference. Co-runs the **AI Ninjas** community and open workshops with [[Krzysztof Błohaczek]] [[2026-04-16-tutak-obsidian-claude-code]]. Frame: practical AI for working professionals — agents, automation, knowledge management.

## Why I track him

- **Polish-language treatment of the [[Karpathy LLM Wiki]] pattern** — the exact pattern this project implements, demonstrated end-to-end in the 2026-04-16 AI Ninjas workshop with a fully automated ingest pipeline.
- Audience overlap with the user's profile (PMs / practitioners in Poland).
- Productionised the pattern further than most: file-system watcher + yt-dlp/Whisper auto-transcription + 23:00 nightly compile via Claude Code `session start` hook + GLM-OCR for images.

## Key claims / patterns

- **Auto-ingest pipeline beats manual `/ingest`** — sources land in `row/` typed subfolders; a PowerShell file-system watcher kicks off Whisper / yt-dlp / GLM-OCR; a Claude Code `session start` hook runs the wiki compile every night at 23:00.
- **Zero-token preprocessing** — caption fetching + local Whisper + local OCR mean the entire ingest pipeline costs nothing in API tokens; only the compile step uses LLM credits.
- **Custom CRON > Anthropic's "routine runs"** — control + portability. The Anthropic feature only works inside Claude Code; custom hooks work from anywhere.
- **Skill-packaged workflow** — distributes his Karpathy-LLM-Wiki implementation as a Claude Code Skill to AI Ninjas community members.
- **Wiki page types he uses**: sources, concepts (one-topic-one-page), entities (people / companies / projects), single index file (the LLM's first read on any question).

## Related

- [[Krzysztof Błohaczek]] — co-host of AI Ninjas workshops
- [[Andrej Karpathy]] — pattern Tutak demonstrates
- [[Karpathy LLM Wiki]] · [[Obsidian]] · [[Claude Code]] · [[Second Brain]]
- *Kuba Masztalski* — Polish practitioner Tutak references; building a similar second-brain-as-a-service for SMEs (worth tracking; not yet a wiki page)

## Recent sources

- [[2026-04-16-tutak-obsidian-claude-code]] — AI Ninjas workshop: Obsidian + Claude Code as a Second Brain (re-ingested with full Whisper transcript 2026-04-26)
