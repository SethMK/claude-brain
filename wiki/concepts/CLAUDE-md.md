---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# CLAUDE.md

## What it is

A markdown file that loads into Claude's context **every session**. The "always-on" extension point in [[Claude Code]] — for project conventions, build commands, and "always do X" rules.

## How it works

- Claude reads CLAUDE.md from your working directory **up to root**.
- Subdirectory CLAUDE.md files load when Claude opens files there.
- Multiple CLAUDE.md at different levels (managed, user, project) are **additive** — all contribute, conflicts resolved by judgment + specificity.
- Supports `@path` imports.

## When to use vs alternatives

- **vs [[Skills]]** — CLAUDE.md is automatic, every session. Skills are on-demand. Put "always do X" in CLAUDE.md; put "here's how to deploy" in a skill.
- **vs `.claude/rules/`** — Rules can be path-scoped via frontmatter, only loading when matching files are open. Keeps CLAUDE.md focused.

## Rule of thumb

- **Keep CLAUDE.md under 200 lines.**
- If it grows: move reference content to [[Skills|skills]], or split into `.claude/rules/` files.

## Gotchas

- Instructions in CLAUDE.md are **requests, not guarantees**. For things that must hold every time, use a [[Hooks|hook]].
- Conflicts between levels are reconciled by Claude's judgment — write specifically.

## See also

- [[Claude Code]] · [[Skills]] · [[Hooks]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
