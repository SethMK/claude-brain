---
url: https://www.youtube.com/watch?v=n4EVksU_EOs
fetched_at: 2026-04-26 21:05
re_ingested_at: 2026-04-26 21:35
title: "Why LLM Wiki? 🧠 Future Of Knowledge For Agentic AI & Humans"
author: Wanderloots (Callum)
channel_subscribers: 76900
published: 2026-04-25
views_at_fetch: 17078
duration_estimate: ~14 min
transcript_source: captions
---

# Why LLM Wiki? — Future Of Knowledge For Agentic AI & Humans

YouTube video by **Wanderloots** (real first name **Callum**, 76.9K subs), published 2026-04-25. ~17K views in first day. Author is a former IP lawyer / patent agent who quit his job 3 years ago and has been building a personal knowledge graph in Obsidian ever since. The video is the *theory* video — the "why" companion to the many beginner setup tutorials that proliferated after Karpathy's gist.

## Chapter list

1. **0:00** — Why Do Knowledge Graphs Matter?
2. **0:50** — What Is A Knowledge Graph? 3 Key Elements
3. **1:47** — Familiar Knowledge Graph Example
4. **2:37** — Example Source Of Knowledge
5. **3:06** — Obsidian Demo: Knowledge Graph From Book
6. **5:53** — Scaling A Knowledge Graph (3+ Years)
7. **7:16** — How AI Currently Works: RAG
8. **8:19** — The LLM Wiki (Theory)
9. **9:54** — The LLM Wiki (Practice)
10. **10:45** — Concluding Thoughts & Ideas

## Three key elements of a knowledge graph (chapter 2 — verified)

> "There are three things I want to cover first: a node, an edge, and a triple."

1. **Node** — "a thing, a person, an idea, a place, or an event. It's a component or a concept."
2. **Edge** — "a named relationship between two nodes: caused, depends on, leads to, references, etc."
3. **Triple** — "the atom of a knowledge graph: subject, relationship, and object. That's the entire model: two things and one connector."

(Earlier metadata-only stub guessed "emergent structure" as the third element — wrong. Triple is the actual atomic unit.)

## Graph RAG vs RAG (chapter 7 — verified)

> "On larger complex data sets, graph RAG significantly outperforms RAG. Rather than retrieving thousands of chunks of information, burning through your tokens, the AI can follow the relationship between sources much more effectively."

This is a stronger framing than the original metadata-only stub captured. The video explicitly names **Graph RAG** as the contrast — not just "graphs vs RAG" in the abstract.

## Two-vault pattern (chapter 8 — author's actual practice)

> "I like to keep a separate human vault that's only based on my own thinking, and then I have an LLM vault, or LLM Wiki, that I use for my AI generation to provide to different AI tools. That way I easily know what came from me and what came from AI."

The Claude Brain project currently uses a single vault (the LLM-Wiki layer), with the user's human notes elsewhere. Wanderloots' two-vault separation is one design choice; ours is another. Worth noting in [[Karpathy LLM Wiki]] as a known variant.

## Three layers of the LLM Wiki (chapter 9 — verified, mirrors Karpathy)

1. **Raw sources** — articles and research clipped directly into your vault (e.g. via Obsidian Web Clipper). "The sources remain untouched."
2. **The Wiki** — "An AI agent reads those raw sources and compiles them into clean, interlinked, structured pages. It's a knowledge graph written in plain language."
3. **The maintenance** — "The agent periodically checks the Wiki for contradictions, outdated information, and orphan pages."

Maps 1:1 to Claude Brain's `sources/` → `wiki/` → `/lint` cycle.

## Notable quotes

> "The knowledge isn't lost, it's just trapped in the silos of each tool."
> — On the cross-tool memory problem the LLM Wiki solves.

> "I didn't try to build the graph. I just wrote about the relationship between different concepts. The knowledge graph is just what happens when you're specific about how you take notes."
> — Knowledge graphs are emergent from disciplined linking, not designed up front.

> "Andrej Karpathy… is actually the person that coined the term *vibe coding*."
> — In passing, attributing the term to Karpathy.

(Karpathy quote in the video is from his April 2026 gist, already in [[2026-04-04-karpathy-llm-wiki-gist]] — not transcribed again here.)

## Sponsor (for the record)

"Hungry Minds" — *The Book on Rebuilding Civilization*, Kickstarter project. Discount code WANDERLOOTS10. Out of scope for the wiki.

## Related videos surfaced in the page

- **Teacher's Tech** — "Karpathy's LLM Wiki - Full Beginner Setup Guide" (213K views).
- **Cole Medin** — "I Built Self-Evolving Claude Code Memory w/ Karpathy's LLM Knowledge Bases" (76K views).
- **Paul J Lipsky** — AI App video (35K views).

## Transcript

Source: YouTube auto-captions, fetched via `yt-dlp` and deduplicated. Auto-caption errors include "Waterloos" (should be "Wanderloots"). Otherwise faithful to the spoken content.

```
Google built one for the entire internet. I built one for my own brain. And then I built a second one, not for my own thinking, but for my agentic AI tools. A separate brain that AI agents build and maintain automatically so that every AI tool I use shares the same structured knowledge graph. The LLM Wiki has become more popular recently, but it's actually grounded in years of research. To understand how and why it all works, I'll go through what a knowledge graph is, how they can form a wiki for humans and LLMs, and why that matters for the future of AI and knowledge. If you're already taking notes, you might just be one step away from building your own knowledge graph. Now, let's build some knowledge.

Hi, my name is Callum, also known as Wanderloots, and welcome to today's video on the future of knowledge for both humans and AI. When I first quit my job as an intellectual property lawyer 3 years ago, I did a deep dive into understanding what was going to set myself up best for the future of AI. After months of research, the solution was clear. Build my own knowledge graph, a map of my brain, how I think that AI can follow forever. Now, AI is finally at a point where it integrates seamlessly with our existing knowledge, if you structure it properly.

But before we get into building that, there are three things I want to cover first: a node, an edge, and a triple. A node is a thing, a person, an idea, a place, or an event. It's a component or a concept. An edge is a named relationship between two nodes: caused, depends on, leads to, references, etc. A triple is the atom of a knowledge graph: subject, relationship, and object. That's the entire model: two things and one connector. Once you understand that atomic building block of a knowledge graph, it's just about iterating and building on it over time. Each atomic unit begins to connect to another, and it scales and compounds as you add more knowledge into your graph.

So, for example, if we go to Google and we search something like the Toronto Reference Library, we can see that on the side here we get what's called the knowledge graph panel. So, even though you didn't click on a single link, Google went through an entire map of all of the relationships for the Toronto Public Library, the reference library. It brought in Google reviews, website, directions. There's a summary here, the address, the architect. All of this is information where each one of these is a separate node inside of Google's knowledge graph. This is also how Wikipedia works. We can see that each of these highlighted words is effectively a separate node in the knowledge graph that is Wikipedia. Someone actually took Wikipedia and dropped it into Obsidian to show what 1.1% of all of Wikipedia looks like. All of these dots are nodes and all of the lines are edges. And this is just 1% of what Wikipedia looks like. You can imagine what Google looks like.

Now, before we get into the complexity of an LLM Wiki, I thought it might be helpful for you to take a look at something that we're all familiar with. A book. A book is a great way to understand how knowledge graphs work, because a book is effectively a physical knowledge graph. Before writing, the author has to come up with all of these concepts and then how they all connect together: nodes and edges. To help build a knowledge graph so you can understand it, I thought, why don't we take a look at a few of these pages and see how we can build a knowledge graph from scratch.

So, now if we go over to Obsidian for a second, we can see that I have a knowledge graph already built here. This is my tutorial vault, where I have all of these different tags, all of these different node types, and they all connect between the different nodes and edges to create this map. Since I'm an IP lawyer and a patent agent, I've always been fascinated with inventions. Why don't I show you how we can create a knowledge graph with a few of my favorite inventions. So, you can see here I just created this new note, and that automatically created this node on the side here. So, why don't I write an example sentence. So, we can see here I have a knowledge graph, so I can highlight this, press the two square brackets, and right away a new node and edge gets brought into my note. And this is because knowledge graph is now its own note or node, and it's linked because it's written inside of this note here. I can do the same thing with flywheel, and we'll start to see the knowledge graph of this particular note grow in real time. And if I want, I can click into this separate note, and that creates the new one here. And I can continue adding more notes as we go. And what's nice, too, is I can expand the depth of this, where we can see, for example, I already have a note on a flywheel, and a flywheel links to the book The One Thing. So, we get this ever-growing knowledge graph. Why don't I add a few more inventions. So, we can see here now how just adding a few more nodes by connecting them to my note on the favorite inventions, we start to get this system that's growing here, this map of all of the different inventions that I just brought in here. We can click into my book note, and we start to see how big this gets. I didn't try to build the graph. I just wrote about the relationship between different concepts. The knowledge graph is just what happens when you're specific about how you take notes.

So, that was building a knowledge graph from scratch. But what happens if we scale this to thousands or tens of thousands of notes?

[Sponsor segment for Hungry Minds — The Book on Rebuilding Civilization. Skipped.]

This is 3 years of notes, thousands of individual connections, each one made while writing one at a time. There's been so many times when I sat down and found connections between what seemed like unrelated concepts, but by looking at the knowledge graph and the smaller subsets of graphs, I'm able to make connections and derive insights in knowledge that I've already curated. This is what happens when you record relationships consistently over time. The structure compounds. And if you're taking notes, regardless of the system, if you bring it into something like Obsidian, you're just one step away from building this knowledge graph as you go. I've also had it many times where I had a new idea, or so I thought, and then I went to go write it down, and I realized I already had a note from a couple years ago, which allowed me to just continue building where I left off with the new element of the idea, rather than having to start from scratch. Building a knowledge graph really is like an investment of time and attention, rather than just starting from scratch every time you're trying to build something new. Over time, it compounds into a system that actually matches how I think.

But this personal knowledge system isn't just for myself. It's also the perfect foundation to plug into artificial intelligence. And that dramatically changes how the AI works with you when you're bounding it within the knowledge that you've already curated. But before we get into the automated LLM Wiki, I want to quickly talk about how AI currently works when you're using it. If you understand how it currently answers your questions, you'll better understand the value of a graph-based system that we'll get into in a little bit.

When you ask AI to search your documents, it uses something called RAG, retrieval augmented generation. It converts your notes into numbers, finds the ones most similar to your question, and retrieves those chunks of text. For simple questions like what is X, this works great. But the problem is not when the answer to your question lives within one or a few documents, but what happens when it lives between the documents, between the connections and how they relate to one another. In that case, you don't just need a chatbot giving you an answer, you need a reference librarian. You need something that knows which books led to which, which chapters are related, which ideas depend on one another. For simple questions, normal RAG is fine. But when you get into complex or high-volume information across many sources, we can use something called graph RAG. On larger complex data sets, graph RAG significantly outperforms RAG. Rather than retrieving thousands of chunks of information, burning through your tokens, the AI can follow the relationship between sources much more effectively. The best part is that we can build a simple version of graph RAG ourselves using something like Obsidian, our knowledge graph, and the AI tools we're already familiar with.

Many of us switch between AI tools depending on rate limits and performance. Each tool has its own built-in memory, which works great while you're in that tool, but completely fails when you're switching between tools. The knowledge isn't lost, it's just trapped in the silos of each tool. What if, instead of the context being fractured across all of these different tools, it lived in a structure of its own? An LLM Wiki, or a shared brain, a shared structured knowledge set for all of your different AI tools.

The LLM Wiki as a concept has been gaining a lot of popularity recently due to an article by Andrej Karpathy. He's formerly from OpenAI, and he's actually the person that coined the term vibe coding. He frames it as: "The idea here is different. Instead of just retrieving from raw documents at query time, the LLM incrementally builds and maintains a persistent wiki, a structured interlinked collection of markdown files that sits between you and the raw sources. When you add a new source, the LLM doesn't just index it for later retrieval. It reads it, extracts the key information, and integrates it into the existing wiki, updating entity pages, revising summaries, noting where new data contradicts old claims. The knowledge is compiled once and then kept current. It's not rederived on every query."

This shared brain that you use for AI can be a part of your own existing knowledge base, or it can be completely separate. It's completely up to you how you want to separate it, or if you want to keep them together. For example, for myself, I like to keep a separate human vault that's only based on my own thinking, and then I have an LLM vault, or LLM Wiki, that I use for my AI generation to provide to different AI tools. That way I easily know what came from me and what came from AI.

The LLM Wiki has layers. First, raw sources, articles and research clipped directly into your vault, for example, using something like Obsidian's Web Clipper. The sources remain untouched. Second, the Wiki. An AI agent reads those raw sources and compiles them into clean, interlinked, structured pages. It's a knowledge graph written in plain language. Third, the maintenance. The agent periodically checks the Wiki for contradictions, outdated information, and orphan pages. Your knowledge base stays accurate without you having to monitor it. The result is a living knowledge graph that grows with your research, maintained by AI and readable by all of the AI tools you use.

If you want me to show you how to set up an LLM Wiki from scratch, how to firewall it between your different vaults, or how to connect it between multiple AI agents, please let me know in the comments and I'm happy to make a dedicated video that dives deeper into it.

Your human vault is where your thinking lives. Your agentic vault is where your AI tools work from. Together, they're the closest thing we have to a true second brain, an augmented personal knowledge management system.
```
