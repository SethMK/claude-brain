---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Skills

## What it is

A markdown file containing knowledge, workflows, or instructions that Claude can use. **The most flexible extension point** in [[Claude Code]].

## How it works

Skills load in two ways:

- **Auto-match** — Claude reads skill descriptions every session and loads the full content when your task matches.
- **Explicit invoke** — `/<name>` (e.g. `/deploy`).

A skill can be:

- **Reference** — knowledge Claude uses (like an API style guide)
- **Action** — does something (like `/deploy` running a checklist)

## Two execution modes

- **In current conversation** — full content loads into your context.
- **In an isolated [[Subagents|subagent]]** — set `context: fork` in the skill's frontmatter; the work happens elsewhere, only the result returns.

## When to use it (vs alternatives)

- **vs [[CLAUDE-md|CLAUDE.md]]** — CLAUDE.md is "always loaded" project-wide. Skills are on-demand for specific tasks.
- **vs [[Subagents]]** — Skills are content; subagents are workers. **They combine.**
- **vs [[MCP]]** — MCP gives Claude *capability* (action). Skills give Claude *knowledge* about how to use that capability well.
- **vs [[Hooks]]** — Hooks guarantee execution. Skills give Claude flexibility to decide.

## Gotchas

- **Skill descriptions live in context every session** — vague descriptions burn tokens AND cause wrong-skill loads.
- Set `disable-model-invocation: true` for side-effect-y skills you only want to trigger yourself.
- Skills **don't inherit into subagents** — pass them explicitly via the `skills:` field.

## See also

- [[Claude Code]] · [[Subagents]] · [[Plugins]] (skills can be packaged)
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
