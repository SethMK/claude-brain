---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Agent teams

## What it is

Multiple independent [[Claude Code]] sessions that coordinate on shared tasks and message each other. **Experimental, disabled by default.**

## How it works

- Each teammate is its own Claude session with its own context window.
- They communicate via shared tasks and peer-to-peer messages.
- Not just parallelism — they can challenge each other's findings, divide ownership.

## When to use vs Subagents

| | [[Subagents\|Subagent]] | Agent team |
|---|---|---|
| Coordination | Main agent manages | Self-coordinated |
| Communication | Reports to main only | Teammates message each other |
| Cost | Lower (summary returns) | Higher (each is full Claude) |
| Best for | Focused worker tasks | Parallel work needing discussion |

## When to reach for it

- Research with **competing hypotheses**
- Parallel code review (security + perf + style teammates)
- New feature development with separate ownership per teammate

## Gotchas

- **Experimental** — disabled by default. Opt in deliberately.
- Higher token cost than [[Subagents]].

## See also

- [[Claude Code]] · [[Subagents]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
