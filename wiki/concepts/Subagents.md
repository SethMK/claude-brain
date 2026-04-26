---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Subagents

## What it is

An isolated execution context that runs separately from your main [[Claude Code]] conversation and returns only a summary. Use them when work would flood your context with intermediate output.

## How it works

- You (or Claude) spawn a subagent with a focused task.
- Subagent gets a **fresh context**: shared system prompt + any [[Skills]] you preload (`skills:` field) + [[CLAUDE-md|CLAUDE.md]] + your prompt.
- It runs its own loop, then returns a summary.
- Your main conversation never sees the intermediate work.

## When to use

- Research that would read dozens of files
- Parallel tasks
- Specialised workers (e.g. a "test runner" subagent)

## Vs Agent teams

- **Subagent** = main agent manages the work; subagent reports back.
- **[[Agent teams]]** = independent teammates that message each other directly.
- **Transition:** parallel subagents hitting context limits → upgrade to agent teams.

## Gotchas

- **Skills don't inherit.** You must specify `skills:` explicitly when launching.
- Token cost is lower than a full second session, but each subagent still spends tokens.

## See also

- [[Claude Code]] · [[Skills]] · [[Agent teams]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
