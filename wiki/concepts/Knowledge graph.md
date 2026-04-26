---
type: concept
status: draft
last_updated: 2026-04-26
sources: ["[[2026-04-25-wanderloots-why-llm-wiki]]", "[[2026-04-04-karpathy-llm-wiki-gist]]"]
---

# Knowledge graph

## What it is

A network of **entities** (concepts, people, tools, sources) connected by **named relationships**. Querying a graph means traversing links, not searching text. Obsidian's `[[wikilinks]]` + graph view are the simplest tractable form for a non-developer.

## Three elements (Wanderloots framing)

1. **Node** — *"a thing, a person, an idea, a place, or an event. It's a component or a concept"* [[2026-04-25-wanderloots-why-llm-wiki]]. In this wiki: pages in `concepts/`, `tools/`, `people/`, `workflows/`.
2. **Edge** — *"a named relationship between two nodes: caused, depends on, leads to, references, etc."* In this wiki: every `[[wikilink]]` in a page body or `sources:` front-matter array.
3. **Triple** — *"the atom of a knowledge graph: subject, relationship, and object. That's the entire model: two things and one connector."* The atomic unit that, repeated, scales into the graph.

The graph itself is **emergent**: *"I didn't try to build the graph. I just wrote about the relationship between different concepts. The knowledge graph is just what happens when you're specific about how you take notes."*

## Why it beats RAG for compounding knowledge

Standard RAG re-derives knowledge per query — search documents, stuff context, answer, throw away. **Nothing accumulates.**

A knowledge graph **compiles synthesis once** and reuses it. The LLM does the read-and-cross-link work at ingest time; future queries traverse the existing structure instead of re-reading raw sources [[2026-04-04-karpathy-llm-wiki-gist]]. The graph is also a **human-readable artifact** — you can scroll the graph view, share it, version-control it, port it across LLMs.

The trade-off: graphs are harder to start. RAG works on a folder of PDFs day one. A graph requires schema (page types, link conventions) and discipline (the LLM must actually maintain the cross-references, not just append). [[CLAUDE-md|CLAUDE.md]] is where that discipline lives.

### Graph RAG (the named middle ground)

Wanderloots calls out **Graph RAG** as the explicit pattern: *"On larger complex data sets, graph RAG significantly outperforms RAG. Rather than retrieving thousands of chunks of information, burning through your tokens, the AI can follow the relationship between sources much more effectively"* [[2026-04-25-wanderloots-why-llm-wiki]]. The [[Karpathy LLM Wiki]] is one informal implementation of this: the graph is the markdown vault, traversal is wikilink-following, no separate vector store needed.

## When to use it

- You're building knowledge in **one domain over months/years** (research, PM, learning a topic deeply).
- Sources overlap heavily — same people, same concepts cited repeatedly.
- You want the artifact to outlive the current LLM you're using.

Don't bother for one-off questions or short-lived projects. RAG or plain chat is fine.

## Gotchas

- **Schema drift** — without `/lint`, link conventions decay; orphans accumulate.
- **The "knowledge" is only as good as the LLM's compile pass.** Silent hallucination during cross-linking is a real risk; the [[Karpathy LLM Wiki]] page lists the mitigations this project uses.
- **Graph view is decorative for small vaults.** Becomes useful around 50+ interconnected pages, per Wanderloots' 3+ year experience [[2026-04-25-wanderloots-why-llm-wiki]].

## See also

- [[Karpathy LLM Wiki]] — the LLM-maintained graph pattern this project implements
- [[Obsidian]] — the canonical IDE for knowledge graphs
- [[Wanderloots]] — non-dev framing of graphs vs RAG
