---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]"]
---

# Plugins

## What it is

The packaging layer for [[Claude Code]] extensions. A plugin bundles [[Skills]], [[Hooks]], [[Subagents]], and [[MCP]] servers into one installable unit.

## Why

- **Reuse** the same setup across multiple repositories
- **Distribute** to others via a [[Plugin marketplaces|marketplace]]
- Plugin skills are **namespaced** (e.g. `/my-plugin:review`) so multiple plugins coexist

## When to use

- Second repo needs the same setup → package it
- You want to share a workflow with your team / community
- Building a reusable capability that combines multiple extension types

## Vs single skill

A single skill in `.claude/` is fine for one project. A plugin is the right answer when:

- You need to bundle hooks + skills + MCP together
- The bundle should be installable as a unit
- Multiple people / projects will use it

## See also

- [[Claude Code]] · [[Skills]] · [[Hooks]] · [[MCP]] · [[Plugin marketplaces]]
- Source: [[2026-04-26-extend-claude-code-docs-hub]]
