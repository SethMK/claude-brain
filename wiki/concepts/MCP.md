---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-26-extend-claude-code-docs-hub]]", "[[2025-06-05-lennys-newsletter-krieger-anthropic-cpo]]"]
---

# MCP

## What it is

**Model Context Protocol** — the standard for connecting [[Claude Code]] to external services and tools. Without MCP, Claude can't query your database, post to Slack, or control a browser.

## How it works

- An MCP server exposes **tools** (functions) to Claude.
- Tool **names** load at session start (low context cost). **Full schemas** stay deferred until Claude needs a specific tool — this is "tool search".
- Servers are scoped by precedence: `local > project > user`.

## When to use vs alternatives

- **vs [[Skills]]** — MCP gives Claude *capability* to act externally. Skills give Claude *knowledge* about how to use that capability well. **They combine**: an MCP connects to your DB; a skill teaches Claude your schema.
- **vs [[Hooks]]** — Hooks fire on lifecycle events. MCP gives Claude on-demand actions.

## Gotchas

- **Connections fail silently mid-session.** If a tool stops working, run `/mcp` to check. Claude won't always notice.
- Many idle MCP tools = tool-search noise. Disconnect ones you're not using.
- Run `/mcp` to see token cost per server.

## Why it matters strategically

Per [[Mike Krieger]] (Anthropic CPO), MCP is **"the fastest-growing standard in tech history"** ([[2025-06-05-lennys-newsletter-krieger-anthropic-cpo]]). Microsoft is integrating MCP into Windows. Krieger's vision: *"everything becomes an MCP endpoint"*. For PMs: the integration story is moving from "ship one connector at a time" to "the substrate exists; compose against it".

## See also

- [[Claude Code]] · [[Skills]] · [[Plugins]] (MCP servers can be bundled) · [[Mike Krieger]]
- Sources: [[2026-04-26-extend-claude-code-docs-hub]], [[2025-06-05-lennys-newsletter-krieger-anthropic-cpo]]
