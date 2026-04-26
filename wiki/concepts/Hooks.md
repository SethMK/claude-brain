---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Hooks

## What it is

Scripts, HTTP requests, prompts, or [[Subagents|subagents]] that fire automatically on [[Claude Code]] lifecycle events (`PostToolUse`, `SessionStart`, etc.). The **enforcement** layer.

## How it works

- Hooks register against specific events.
- When the event fires, every registered hook runs (no priority — all of them).
- Hooks execute outside Claude's main context. Output (if any) is fed back as text Claude reads.

## Vs Skill

| | Hook | [[Skills\|Skill]] |
|---|---|---|
| Trigger | Lifecycle event | You typing `/<name>` or Claude matching desc |
| Determinism | **Always fires** | Claude interprets |
| Context cost | Zero unless output returned | Description loads every session |
| Best for | Linting, blocking unsafe commands, logging | Reasoning workflows, reference material |

## The critical principle

> Instructions in [[CLAUDE-md|CLAUDE.md]] or a skill are **requests**. A `PreToolUse` hook is **enforcement**.

If a rule must hold every time (e.g. "never edit `.env`"), make it a hook, not a prompt instruction.

## Gotchas

- **Hook output lands in context.** A linter hook returning 500 lines bloats your conversation.
- Hooks are project-wide — keep them tight or scope by event/tool match.

## See also

- [[Claude Code]] · [[CLAUDE-md|CLAUDE.md]] · [[Skills]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
