---
type: tool
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Claude Code

## What it is

Claude's terminal-native agentic coding system. Combines a model that reasons about your code with built-in tools (file ops, search, exec, web), plus a 7-piece **extension layer** for customising what Claude knows and does.

Canonical docs: [code.claude.com](https://code.claude.com/docs/en/features-overview).

## How I use it

As a PM / researcher / non-dev, two surfaces matter:

- **Terminal CLI** — for repo work (the Claude Brain wiki itself runs here)
- **VS Code extension** — for inline edits while pairing with engineers
- (also available in Cowork)

The extension layer is what makes it useful beyond chat: my own [[Skills]] turn repeated workflows into one-line invocations.

## The 7 extension plug-points

| Extension | Loads when | Best for |
|---|---|---|
| [[CLAUDE-md\|CLAUDE.md]] | Every session | "Always do X" project rules |
| [[Skills]] | On demand or auto-match | Reusable workflows + reference content |
| [[Subagents]] | When spawned | Isolated work returning a summary |
| [[Agent teams]] | When orchestrated | Parallel sessions that talk to each other (experimental) |
| [[MCP]] | Session start | Connecting to external services (Slack, DB, browser) |
| [[Hooks]] | On lifecycle events | Guaranteed automation (lint after edit) |
| [[Plugins]] | Always | Packaging for distribution |

## Build it over time

You don't configure all of this upfront. Triggers tell you when to add what:

| Trigger | Add |
|---|---|
| Claude gets a convention wrong twice | [[CLAUDE-md\|CLAUDE.md]] entry |
| You keep typing the same prompt | User-invocable [[Skills\|skill]] |
| Same playbook three times | Captured [[Skills\|skill]] |
| Copying from a tab Claude can't see | [[MCP]] server |
| Side-task floods your context | [[Subagents\|subagent]] |
| "Should always happen" | [[Hooks\|hook]] |
| Second repo needs the same setup | [[Plugins\|plugin]] |

## Limits

- [[MCP]] connections can fail silently mid-session — `/mcp` to check
- [[Skills\|Skill]] descriptions live in context every session; vague descriptions burn tokens
- [[Hooks]] are *guarantees*, prompt instructions are *requests* — for safety, use a hook

## See also

- [[CLAUDE-md|CLAUDE.md]] · [[Skills]] · [[MCP]] · [[Subagents]] · [[Agent teams]] · [[Hooks]] · [[Plugins]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
