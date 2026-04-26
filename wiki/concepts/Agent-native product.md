---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2025-06-05-lennys-newsletter-krieger-anthropic-cpo]]", "[[2026-04-26-krieger-ai-coworker-era-youtube]]"]
---

# Agent-native product

## What it is

Coined by [[Mike Krieger]]: a product designed from day one assuming the user is **partly or fully an AI agent**, not a human typing into a chatbox. The framing separates Anthropic's product strategy from "AI bolted onto existing UX" approaches.

## Core principles (per Krieger)

- **Don't trap intelligence in a chat box** — the model should compose actions across tools, not just emit text
- **Long-running sessions over single-turn** — agents work for hours, not seconds (Sonnet 4.5 hit a **30-hour autonomous run** on a software-engineering job per [[2026-04-26-krieger-ai-coworker-era-youtube]])
- **Coworker, not assistant** — the AI owns tasks, doesn't just answer questions
- **MCP as the substrate** — *"everything becomes an MCP endpoint"*
- **Transparency first** — "Erring on transparency is definitely the way to go at this stage." Show thinking, tool calls, MCPs in threads — currently necessary for trust + error remediation [[2026-04-26-krieger-ai-coworker-era-youtube]]
- **Non-determinism infects design** — designers can't operate from a "perfect golden path"; users arrive at any state via prompts

## Updated 2026-04-26: chat is durable

Earlier reads of Krieger's work might suggest "kill chat." His more recent framing in [[2026-04-26-krieger-ai-coworker-era-youtube]] **walks that back**:

> "I've evolved from thinking that it's an error in the tech tree that we've ended up with conversation as the main way we interact, and realized more that it's actually a pretty natural way where most people get it."

What changes is the **shape** of the conversation: turn-based synchronous chat → **async coworker threads** as work gets longer. The interface stays text-input + text-output; the rhythm and context shift.

## The virtual-coworker scorecard

Krieger maintains an internal scorecard of capabilities still missing for a "credible virtual coworker" [[2026-04-26-krieger-ai-coworker-era-youtube]]:

- **Proactivity / social awareness** (knowing when to chime in vs. stay quiet)
- **Autonomy**
- **Memory**

Useful as a tracking framework for evaluating each new model release.

## Where this shows up

- [[Claude Code]] — terminal-first, agentic by default
- [[Cowork]] — productises the coworker framing for non-devs
- [[MCP]] — the protocol that enables composition
- [[Skills]] — let the agent learn your specific patterns

## Why it matters for PMs

- Old PM playbook (input → output, conversational): wrong shape for this era
- New playbook: design for the **decision-making bottleneck** ([[Mike Krieger|Krieger]]'s phrase)
- Agent-native products generate **10x leverage** when paired with embedded AI researchers (per [[Mike Krieger|Krieger]])

## See also

- [[Mike Krieger]] · [[Claude Code]] · [[Cowork]] · [[MCP]]
- Sources: [[2025-06-05-lennys-newsletter-krieger-anthropic-cpo]], [[2026-04-26-krieger-ai-coworker-era-youtube]]
