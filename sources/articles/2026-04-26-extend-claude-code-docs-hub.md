---
url: https://code.claude.com/docs/en/features-overview
fetched_at: 2026-04-26 14:14
title: "Extend Claude Code"
---

# Extend Claude Code (docs hub)

> Source: https://code.claude.com/docs/en/features-overview
> Re-fetch for full content; this file is a structural extract.

## TL;DR

- Claude Code's extension layer has **7 plug-points**: CLAUDE.md, Skills, Subagents, Agent teams, MCP, Hooks, Plugins (+ Marketplaces for distribution).
- **Skills are the most flexible**: knowledge OR workflows, auto-match OR explicit invoke, in-conversation OR isolated.
- The page provides authoritative **comparison tables** (Skill vs Subagent, CLAUDE.md vs Skill, Hook vs Skill, etc.) that drive when to use what.

## Compiled into wiki

- [[Claude Code]] (tool) — created
- [[CLAUDE-md|CLAUDE.md]] (concept) — created
- [[Skills]] (concept) — created
- [[Subagents]] (concept) — created
- [[Agent teams]] (concept) — created
- [[MCP]] (concept) — created
- [[Hooks]] (concept) — created
- [[Plugins]] (concept) — created
- **Wanted:** [[Plugin marketplaces]] (referenced from Plugins, not yet created)

## Key extracts

### The 7 plug-points

| Feature | What | When |
|---|---|---|
| CLAUDE.md | Persistent context loaded every conversation | "Always do X" rules |
| Skill | Instructions, knowledge, workflows | Reusable content, repeatable tasks, `/<name>` |
| Subagent | Isolated execution context, returns summary | Context isolation, parallel tasks |
| Agent teams | Multiple independent sessions coordinating | Parallel work needing discussion (experimental) |
| MCP | Connect to external services | Database, Slack, browser |
| Hook | Script/HTTP/prompt/subagent on lifecycle event | Linting, guardrails, logging |
| Plugin | Packages skills+hooks+subagents+MCP | Distribution / cross-repo reuse |

### Build-over-time triggers

| Trigger | Add |
|---|---|
| Wrong twice | CLAUDE.md entry |
| Same prompt twice | User-invocable skill |
| Same playbook three times | Captured skill |
| Copying from a tab Claude can't see | MCP server |
| Side-task floods context | Subagent |
| Should always happen | Hook |
| Second repo needs the same setup | Plugin |

### Layering rules (when same feature exists at multiple levels)

- **CLAUDE.md** — additive (all levels contribute)
- **Skills/subagents** — override by name (managed > user > project; plugin skills are namespaced)
- **MCP servers** — override by name (local > project > user)
- **Hooks** — merge (all matching hooks fire)

### Combination patterns

- **Skill + MCP** — MCP connects, skill teaches Claude how to use it well
- **Skill + Subagent** — skill spawns subagents for parallel work
- **CLAUDE.md + Skills** — CLAUDE.md says the rule; skill has the reference
- **Hook + MCP** — hook triggers external action through MCP

### Context cost (always-loaded)

- CLAUDE.md — full content, every request
- Skills — descriptions only at session start; full content when used
- MCP — tool names only; schemas deferred (`tool search` is on by default)
- Subagents — isolated from main session
- Hooks — zero unless they return output

## Authoritative principle (from the page)

> Instructions in CLAUDE.md or a skill are *requests*. A `PreToolUse` hook is *enforcement*. For rules that must hold every time, make it a hook, not a prompt.
