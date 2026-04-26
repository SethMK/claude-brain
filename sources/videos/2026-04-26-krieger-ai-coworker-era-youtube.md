---
url: https://www.youtube.com/watch?v=8cxRM4m_3V8
fetched_at: 2026-04-26 18:30
re_ingested_at: 2026-04-26 22:08
title: "Inside Claude: The AI Coworker Era — Mike Krieger, Anthropic"
author: "Mike Krieger (Anthropic, interviewed)"
format: Podcast interview (sponsor reads suggest the host channel runs a recurring product/tech show; specific name not surfaced in transcript)
transcript_source: captions
transcript_words: ~13000
---

# Inside Claude: The AI Coworker Era

Long-form podcast interview with [[Mike Krieger]] (CPO, Anthropic). Re-ingested 2026-04-26 with the YouTube captions path; full transcript appended at the bottom under `## Transcript`.

## TL;DR

Krieger covers his **first ~1.5 years at Anthropic** (joined May 2024 after selling Instagram), the **Sonnet 4.5 release** highlights, and his evolving views on **chat as a durable interface**. Most quotable section: he's **changed his mind** on chat being an "error in the tech tree" — watching people use Claude Code for non-coding (research, to-do lists) convinced him the flexibility of conversation is hard to beat with constrained custom UIs.

## Key claims (verified from transcript)

### On the Sonnet 4.5 release

> "When we released Opus, our largest model, in our last rev of it, in the middle of the year… one customer was able to get it to run for seven hours. It was like a refactoring job. And this time around, one of our early access customers got it to run for **30 hours** uh on a complex software engineering job."

Two headlines for 4.5: (a) longer-horizon agentic tasks; (b) better social awareness — *"by far the model we've trained that has the best ability… to be in our shared Slack and actually know when to chime in or not."*

### On the "virtual coworker" scorecard (what's still missing)

Krieger maintains an internal scorecard of capabilities needed to reach a credible virtual coworker:

- **Proactivity / social awareness** — "knowing when to chime in or not." 4.5 is the best yet, but still needs "scale it back a little bit" instructions.
- **Autonomy**
- **Memory**

> "Be able to not just connect the right data sources but also even write the connectors to connect to the right data sources."

### On chat as the durable form factor

> "I came in, it's like, I can't believe we're still chatting with AI. Like, what are we doing? […] What really changed my mind was watching people start using cloud code not for coding but for solving their own research problems or managing their to-do lists. You realize, oh, the flexibility of basically providing live instruction to the model and then figuring out how to connect the right data behind the scenes is really powerful still."

> "I've evolved from thinking that it's an error in the tech tree that we've ended up with conversation as the main way we interact, and realized more that it's actually a pretty natural way where most people get it. Now the thing that needs to evolve is — it's not just about a turn-based back-and-forth. As the work evolves and starts taking on longer and longer, it will feel more like talking to a coworker and it's going to feel more asynchronous."

This is a meaningful update to the [[Agent-native product]] framing — chat survives as the **input** modality, but the *interaction shape* shifts to async coworker-style threads.

### On product principles

Two design principles he holds for AI products:

1. **Transparency first** — "Erring on transparency is definitely the way to go at this stage." Internal Anthropic agents start a thread with themselves, put thinking + tool calls + MCPs in the thread, then post the final answer in the route. Not always desirable long-term ("you don't ask a coworker to explain step by step — it'd be tedious") but currently necessary for error remediation and trust.
2. **Robustness via evals + user testing** — "You can't just push the pixels and you can't just sort of prompt it perfectly once and be like, great, this is deployable."

### On design for AI products

- House style is necessary but homogenising — "if all software looked like Claude's house style, super boring + very hard for you to feel like this is my product."
- Brand + cohesion still matter. Krieger sits on the Figma board.
- Open problems: how to make MCPs, advanced research, virtual machines (in Cloud for Enterprise) "hang together and sing" — pure text/chat won't carry it.
- "Non-determinism infects the design process" — designers can't operate from a perfect golden path; users can arrive at any state via prompts.

### On Anthropic vs competitors

> "Anthropic's only been around for a few years and it's winning on some very meaningful vectors… What's the special sauce?"

Krieger's answer: mission alignment + cohesion + focus + talent density. "Smaller team, less compute, less funding even though we've raised large funding rounds — it still feels like we're smaller than the others. But focus and cohesion takes you a long way."

### Cited Anthropic value

> **"Hold light and shade"** — explicitly named as a company value. He invokes it when answering the "what does a fully leveraged individual look like" question to balance optimism with concerns.

### On personal use of Claude (the "Can I Claude that?" mindset)

> "The sort of overarching question I ask is: 'Can I Claude that?' or 'Can Claude do that for me?'"

He credits his **wife** for pointing out gaps where he wasn't applying Claude. Concrete uses he names:
- **Strategy critique** — "What am I missing? Please poke holes in my strategy. What are some of the objections you might imagine?"
- **Getting smart** — "If I had to bug [Anthropic's smartest people] every five minutes to ask what did you mean by this, it would not be the best use of their time."
- **Different explanation formats** — charts, graphs, presentations, process diagrams. *"Different people learn differently and Claude can adapt that explanation to where you are."*
- **Personal**: travel research, finding niche museums, watch/read recommendations.

### External AI products Krieger likes

- **[Levels](https://levelshealth.com)** — meal logging via image segmentation. *"It took an activity that was a pain to do every time… very fast to take a fast photo of something."*
- **Voice input / Super Whisper** — *"I'm getting older. I like typing less."* He prepared a 30-minute talk by dictating during commutes, then running through an LLM to ask questions / synthesize.
- **ElevenLabs** — had it read his talk back to him. *"It very quickly was like, oh that part's clunky. This part feels slow. I'm bored here. If you're bored of your own talk, it's a bad sign."*

### On bias

> "It's impossible to have a model that has zero bias in any direction. I think it'd be hard for it to say anything at all."

### Hold-light-and-shade closing

**Light:** Claude makes "better than first-principles thinking" available to people without access to "the world's best CFO, CPO, lawyer." Uplevels SMBs, side businesses, early-stage companies. *"Up-leveling those disciplines within startups and small businesses is going to be very impactful on the world economy."*

**Shade:** *"It can actually make us lonelier. Even within Anthropic… people are more productive but they're also less connected."* Their response: hosting cross-team dinners to engineer connectivity since technical questions to colleagues have dropped. *"Companies and society will have to reinvest in moments of connectivity."*

### Founding thesis (closing)

> "Maybe the founding thesis of Anthropic is that we can build extremely powerful models but do so safely. […] With Sonnet 4.5, basically on every metric we look at from an agentic behavior and capability side we improve. But it also is our safest model yet — the least jailbreakable, the most honest. My hope is that we can continue to push both of those frontiers at once."

## Why it matters to Claude Brain

- Strongest-yet quote on **chat-as-durable-interface** — directly relevant to [[Agent-native product]]: chat *is* the right modality, but the interaction shape becomes async/coworker-like.
- The "**Can I Claude that?**" mindset is repeatable and quotable for non-dev evangelism — fits the user profile.
- The **virtual-coworker scorecard** (proactivity, autonomy, memory) gives concrete capability axes for tracking model progress.
- Sonnet 4.5's "30-hour autonomous run" is the new headline stat to use.

## Transcript

Source: YouTube auto-captions, fetched via `yt-dlp` and deduplicated by `yt-transcript.sh`. Speaker markers in the original VTT (`>>`) are preserved as `&gt;&gt;` (HTML-encoded) — interviewer turns marked with `&gt;&gt;` at the start of a line; Krieger's responses are unmarked or follow `&gt;&gt;` from the host.

```
Kind: captions
Language: en
Google's like this giant behemoth. Open
eye's been around for so much longer as
well, but Anthropic's only been around
for a few years and it's winning on some
very meaningful vectors. What's the
special sauce? What makes Anthropic so
special?
&gt;&gt; I mean, there's a lot of cohesion, which
is why we've been able to get so much
done.
[Music]
&gt;&gt; What is the philosophy of building an
agent AI product? I think erring on
transparency is definitely the way to go
at this stage. What is the ultimate form
factor of interact with agents? I think
it's probably going to be they're going
to be in your Slack or your other
collaboration tools and you'll talk to
them and they'll respond and you're not
going to have to worry about in the same
way that you have to ask a co-orker
question. How do you avoid bias in the
training data? At the end of the day,
train on human generated data and there
could be bias there.
&gt;&gt; Uh it's impossible to have a model that
has zero bias in any direction. I think
it'd be hard for it to say anything at
all. I think it's an interesting process
that I I wish all the labs had, which is
[Music]
&gt;&gt; Mike, thank you so much for making the
time. We're so excited to have you here.
&gt;&gt; It's great to be here. Thanks so much
for having me.
&gt;&gt; Awesome. You've been at Anthropic over a
year now. Uh you also famously co-ounded
Instagram before this, arguably, you
know, the most successful product from
uh web 2 and and the mobile
technological wave. Now you're in the
middle of this, you know, the AI wave. I
just want to understand from your
perspective like what feels tangibly
different on a day-to-day basis like you
know when you're talking to customers,
when you're working with the technology,
when you're looking at the research,
when you're shipping products, what
feels tangibly different compared to
what happened before in in web and
mobile?
&gt;&gt; I think the real world impact um has
come much faster with AI than it did
with mobile. With mobile there was
interest and you definitely saw you know
every bank and startup and you know
there was like a lot more you know
people were sort of seeing it as a new
frontier and therefore like going into
that um uh sort of uh like new direction
but in terms of actual impact on
businesses it took much longer for it to
actually happen. The dollars were
flowing eventually in on advertising but
not so much on SAS for example on the
mobile side of things. So even though it
felt like a you know everybody was you
know what app are you using there's an
app for that there was definitely
cultural impact I think what feels
tangibly different this time is there's
also sort of been business impact and
dollars really dislocating on the
business side as much as they've been
dislocating on the consumer side too
what feels similarly is this feeling of
you know there's a new wave coming who
are going to be the winners who's going
to capitalize it on it well there's
going to be the you know the more
novelty type things and then uh there's
going to be the things that end up being
actually more sustainable Awesome.
Awesome. I I'd love to get some color
around what it's specifically like to
work at Anthropic as well. Arguably,
Anthropic is the underdog in this race.
Like, you know, Google's like this giant
behemoth, you know, that's been around
for so long. Open's been around for so
much longer as well, but Anthropic's
only been around for for a few years and
it's winning on some very meaningful
vectors like uh coding and the
enterprise market as well. What's the
special sauce? What makes Anthropic so
special? Yeah, maybe I'll rewind to why
I ended up joining Anthropic. So, I was,
you know, we sold our second startup,
same co-founders, Instagram, and trying
to decide whether to take some time off,
whether to start another company,
whether to go join somebody else. And I
was really just drawn to the combination
of mission alignment from Anthropic,
just like the fundamental like kindness
and and and like good uh vibes I got
from the people as well. Um, and then
just also the talent density. And so,
there's like, you know, still a pretty
big bet. None of those three guarantee
anything other than you know maybe a
fighting chance. And I think you know
that was May May 20 24 I guess so a year
um and changed you know a year and a
half ago and the thing I couldn't have
anticipated is how much those
ingredients when combined with like with
real focus which is an attribute we
really tried to emphasize at Instagram
as well has led us to you know be you
know I think punch way above our weight
in terms of uh the policy level and
policy influence um the the quality of
our models and how widely they've been
adopted for agents and for coding um and
then also how we've been able to play a
role in the enterprise too. So I'd say
that uh what I perceive from the outside
has been mirrored when on the inside
like there is a very very strong amount
of mission alignment. There's a lot of
cohesion which is why we've been able to
get so much done. Even though the team
is much smaller than our competitors and
we have less compute and we have less
funding even though we've raised large
funding rounds it still feels like we're
uh you know uh smaller than the others.
But I think with focus with cohesion
that takes you a long way um towards
where we're going. I mean, right
Instagram, we got to um almost a billion
users with a pretty small team, right?
And so, I think that that experience
kind of prepared me for you might not
always have the largest team or the most
funding, but if you make the right
decisions, you can at least put yourself
in the mix. Okay, before we move on, a
quick message from our friends and
partners at Vanta. The right kind of
security can make a deal or break it.
Vanta's AI and technology make it easy
for fastmoving startups to get ready to
meet buyer expectations in just a few
days. Vantas technology continuously
monitors your compliance so your deals
are never blocked and our listeners get
a special $1,000 discount when they sign
up. Just go to vanta.com/suphum.
That's van nta.com/suphum.
Awesome. So I want to talk about the the
big news that's come out of Anthropic
this week. Uh signer 4.5. Can you tell
us a little bit about what's new with
this model and you know what should you
know consumers, enterprises and
developers really uh be paying attention
to? Yeah, the largest sort of notable
change with Sonnet 4.5, I'd say like I'd
put it the two headlines are um one,
we've pushed the frontier even further
in terms of how like complex and long
horizon tasks that any of our models can
tackle. Um as one example, when we
released Opus, which is our largest
model, um in uh our last rev of it, uh
in the middle of the year, it was like
May or June. Um we saw that one customer
was able to get it to run for seven
hours. It was like a refactoring job.
And this time around, one of our early
access customers got it to run for 30
hours uh on a complex software
engineering job. So you kind of see, you
know, that's the upper horizon. It's not
to say that every task is going to be
that, but at least kind of shows what
the sort of uh theoretical upper bound
is. So that's one piece which is for
those um agentic hard tasks that can be
coding, that could be other things, it
can run for much much longer. The other
thing that's really notable is we're,
you know, now have a model that's a
fifth the cost of Opus, um, which is our
Sonnet price point. Um, and basically
wipes the floor of Opus that we released
a few months ago on effectively every
benchmark. So, it's this really cool
moment where, um, what we saw with Opus
was people were drawn to the
intelligence, but it's a larger model.
It tends to be a bit slower, definitely
more expensive. Um, you're now having
access to that sort of intelligence, but
at a much much lower uh, price point and
much lower latency as well. And so I'm
already seeing we're only like 4 days in
uh seeing people uh start seeing like
what we might have already seen with
Opus but not a lot of people had tried
because of the price point.
&gt;&gt; Yeah. So we're building products daily
both on the media side and then the
software side as well. And in our
morning stands for both the media team
and the software team like everyone's
noticing significant improvements like
with you know the devs and the engineers
on the team it's like you know the
single shoting feels uh a lot better
than it was before. And same with the
writing team right like it's you know
we're using it so much to edit our
writing and find ideas and try to get
unblock when we can't find just the
right word in those things. And yeah
like yeah s 4.5 seems to be doing
significantly better there. So amazing.
Love it there. Um just more specifically
on the model like are there any
particular use cases or improvements in
in use cases that have really stood out
to you in the last few days?
&gt;&gt; I think what's been really notable is
you know in a lot of ways we're known
for probably like three if you know one
thing about Enthropic you probably know
that our models are good at coding. If
you know two things it's our models are
good at coding and the company is really
focused on responsible scaling. If you
know three things it's also that cloud
tends to have a really good character.
That's what I tend to find when I talk
to people. I'd say that the the thing
that fewer people know about, especially
watching Sonic get deployed now, is
we've really started pushing beyond just
coding into other domains where the
model can become um really specialized
and and and have really powerful
results. I'd say that the two of the
standout ones, one has been within
finance and so both in terms of crafting
Excel files, looking at spreadsheets,
analyzing financial data, writing even
writing code to analyze financial data
as well. That's been one noticeable
piece and you could see it in the
evaluations like got to the top of
finance agent but eval are useful but
they're not the whole story. So actually
getting to see deployments has been
really valuable and the other one is on
the legal domain. So because um sonnet's
able to both look at and understand long
complex documents um that's also been
another emerging area where um there's
lots of startups building on top of
sonnet in that sort of legal domain. And
so I think you'll start seeing over the
coming weeks um any place with complex
analysis or complex uh sort of
understanding and synthesis that the
models are going to continue to show up
really well.
&gt;&gt; So Michael I love loving like the new
model. I was playing with it and it it
truly felt very different from Opus like
how good it was like like the long
context ability to kind of you know
recall things ability to kind of take
things out of the context as well and
the singleshot capabilities like where
like over an hour or two working it was
just able to produce products which I
thought were not possible and really
required help uh for an engineer like to
be like involved in the process and what
got me thinking is that if you're an
enterprise today right like and you know
you may not have access to the best
talent with San Francisco based
companies or New York based companies
have. This is a huge improvement. How
are you seeing enterprises working with
cloud code or some deployments which are
happening which which you might be able
to share?
&gt;&gt; Yeah, I'd say I'd broadly bucket our
kind of enterprise conversations into
three. One is on on the coding side with
cloud code and we see um everything from
large banks that have started adopting
cloud code and rolling them out wall to
wall and startups that you know are now
using that as their their kind of daily
driver agentic coding tool as well. and
often pairing it with some kind of IDE
too. So, uh you're seeing that sort of
range of everything from startups to
enterprises and uh one of the things we
did very intentionally with cloud code
is we designed it so um none of the data
actually flows through one of our
servers first. You can actually go and
deploy cloud code and have it talk
straight to AWS bedrock or straight to
GCP vertex. The reason that matters is
it really simplified procurement. So, uh
you know my background was mostly in
consumer. One of the biggest lessons
learned I had in the first year here is
how much procurement and ease of use and
getting through all the sort of
agreements process of the enterprise
matters and uh we made this very
intentional choice with cloud code is
like keep the architectural simple that
has a bunch of other good implications
but it also makes um procurement much
simpler because a lot of these companies
have already gotten comfortable with AWS
or GCP so that's one one big piece of
the enterprise story the second one is
deploying cloud for enterprise and so I
would say that product went from you
know a kind of you know basic chatbot
with some additional features. Then we
added MCP where we kind of started
painting the promise of, hey, this could
actually unlock some enterprise data to
more recently where we've added the
ability for cloud to actually create
entire, you know, spreadsheets,
presentations, word documents from
scratch that you can then take and load
into the office suite and go edit. Um,
you're starting to see cloud actually be
able to do real work for people. And
it's actually meant cloud for enterprise
is our fastest growing uh product right
now. And I think it's partially because
people are starting to see, hey, this
isn't just a way of having sort of
lightweight conversations with claude.
Um, that was maybe, you know, the
state-of-the-art a year and a half ago.
It's now a way where people are actually
coming and doing work. Um, and then the
last piece I would say on the enterprise
is we're also seeing that for, uh,
especially enterprises in regulated
industries or ones that have, you know,
a lot of internal talent, but maybe not
necessarily a lot of internal technical
talent, um, or a lot of internal AI
talent. we've started partnering more on
like a forward deployed sense where
we'll actually go in um find out what
their real deepest AI use cases are and
partner with their existing tech teams
to go build that out. Um so that's been
really interesting because the feedback
loop is is a very different one right
you're uh basically part of their team
you're hearing about their uh their
challenges their um their goals what it
would actually mean to drive AI success
in the enterprise. Um but I think that's
a really important stage because again
not every company is a as you put like
San Francisco startup with you know uh
like all the engineers that you might
imagine. They often have good engineers
but maybe not the kind of uh sort of AI
native talent that you might need for a
full-on AI transformation.
&gt;&gt; So you mentioned the forward deployed
model. I think I think that that is very
interesting especially as people look to
deploy AI uh capabilities. But it seems
like like you know a lot of large
enterprises like 14,000 and 2000 can
access that because of the cost
associated with that. Spoken to few
mid-market Backed companies and one of
the biggest challenges they mention is
that hey like I don't know what's the
right AI task for us to do. How do I
even evaluate uh if this is a good uh
application for AI? How can I scope it?
Can I test it out? How can someone go
about doing that with claude if you're
you know you may not have access to for
deployed engineers and you just want to
do things on your own like sandboxing
scoping things like that.
&gt;&gt; It's a really good question and so one
of the things that we've we've really
seen is exactly that which is you know
it's obviously not going to scale for us
to have that kind of forward deployed
motion to every part of the market. Uh
we're thinking about this in two ways.
One is um we're taking all of the
insights from more of our like custom
deployment for deployed pieces. Um and
we're going to also make those available
as more of like standard agents that you
know mid-market companies can pull off
the shelf and deploy them internally. So
that's one piece. The other piece that
we found is like cloud even in its
current incarnation is actually quite a
good partner around that implementation.
So describe your problems um bring in
for example we we um we released the
cloud agent SDK alongside with cloud
sonnet 4.5 and that's the same building
block we use for cloud code and for all
of our custom agents work and that same
technology is now available to anybody
in the mid-market as well and claude is
able to implement using the agent SDK.
It gets a little meta uh really quickly
but uh it's able to sort of use those
tools as well. I was just talking to um
uh CPO yesterday and he had said he had
an uh implementation internally of of an
agent and he put in all of the cloud
agent documentation and he asked Claude,
"Hey, should we migrate over to this?"
And then Claude talked through the pros
and cons. And what was interesting is
then he's like, "Well, I don't really
just need it to think through the pros
and cons. Why don't I just have it try
it in a, you know, separate, you know,
directory and see what happens?" And it
went through it and it like kind of
evaluated the pros and cons afterwards.
So I think that the the interesting
thing with a tool like claude and paired
with something like the cloud agent SDK
is you can just try it and you can see
how uh you know is it suiting your
business need is it actually advancing
it forward um without like that cost of
oh we contracted somebody for 3 months
to implement something it can be
something that's much more of a rapid
iteration. No I love that testing piece.
I think like for a lot of companies the
sandboxing and just evaluating things
before going to production is so
critical. So, so Mike, like it kind of
raises another question, right? Like I I
I think Enthropic has pushed the
boundary so much on the on the research
side as well. Now you're seeing really
cool products coming out and they're
like a Gentech products being built on
top of Claw, Gemini, OpenAI as well and
there's sea of them. What are some
signals you look for when you're
evaluating these massive products coming
out be like, hey, this is a good product
and maybe this is not a good one.
there's probably like is this a good
product now and is this a product that's
going to set up to to succeed and scale
and I think they're kind of two related
questions. Um, on the first one, often
uh the best products can be grounded in
some kind of success metric or
evaluation. And I've seen that a lot in
talking to companies that are deploying
AI. They deploy AI and they're like,
"Wait, great like what is what does wild
success look like to you uh for this?"
And the um uh the answer sometimes
really solid like, "Okay, we are trying
to reduce the time to answer support
tickets by x% or we're a legal team. We
have all these questionnaires that come
in. we'd like to reduce our turnaround
time by 2 days. Sometimes it's much
fuzzier and when it gets fuzzy, it's
very hard to then evaluate like did it
help? You know, again, I talked about
cloud for enterprise and I think a lot
of these enterprise chatbot deployments
from like a year and a half or two years
ago, they didn't really have a concrete
success metric. They were driven by sort
of this almost like AI FOMO that was,
you know, kind of happening in the the
CIO suite. And I think now a lot of them
have really upleveled their thinking and
said well if we're going to bring in
this tool we need to see either ROI and
process an improvement in whatever
productivity metric you want to look at
or even just adoption internally is even
that can be a leading indicator of
something else. You know I often get the
question how do I know if cloud code is
working for my organization and whether
measuring developer productivity is an
age-old challenge. I often ask people
just to look at the daily active metrics
because those don't lie. People do not
use tools over and over again every day
if they're not providing value. So
that's how to like evaluate the tools of
today. But then I also asked this
question which is which tools are likely
to continue to scale up as the models
improve. And so the way we talk about
this internally is like we want an AGI
pill product roadmap. And what that
means because it's such a you know uh
sort of general phrase in some ways is
can you imagine how the model
improvements are going to like radically
improve the product itself without
necessarily further work. So an example
of that is um we uh we launched a
research preview of claude in chrome. So
basically you can have claude drive your
your chrome browser and without any
changes to that scaffold we brought in
cloud sonnet 4.5 and because that model
also it made significant strides in in
browser use and computer use that
product just got better because of that.
Similarly to cloud code you know every
time we have a new model snapshot the
very first thing we do is we put it in
cloud code because we know it's a
harness and a use case that really
pushes the bounds there. And so I think
the best sort of agentic products
provide value today but also have a sort
of story or a vision about how they're
going to improve. And it often is the
case that the ones that have like a lot
of constraints on there that basically
feel like a flowchart with like AI maybe
put in in one little part of it are
probably not going to be that. Whereas
the ones that sort of give the agent a
bit more room to run with the right
guardrails of course, but give it more
flexibility in how to solve the problem,
how to solve the task, that's where
you're going to see the sort of
compounding benefit of every model
release actually improving the agent
itself.
&gt;&gt; I think that that's that's a fantastic
answer. One thing I kind of think about
is that what are the modes for agentic
products, right? Like so Enthropic is on
the on the race for AGI going to try to
find the best model which will
eventually get us there. So you're
really controlling this the the
foundations of this AI wave and then
people are building scaffolding on top
of these things to get you some
outcomes. What what is the mode here
especially in the context now Enthropic
is also going into building products
which are to some extent leveraging its
core models like how can like builders
be thinking about these things now
&gt;&gt; I think a lot from the builder side
around you know of course the product
matters and that it's important to have
something that delivers results. Um I
think that ultimately moat and
differentiation is going to come more
from a couple of pieces. One, I talked a
little bit about measuring business
outcomes. If these companies are both
sort of coming forward with an agent,
but also helping companies understand
the impact of that agent on whatever
vertical they're working in, maybe it's
legal, for example, that's a really good
starting point because then when a
different uh you know agent company
comes around, there's a yard stick that
they can measure on. And you know,
ideally, you're not just self- selecting
emails that make your agent look good,
but you're really thinking about what is
what is what does success look like for
a law firm or for, you know, a dental
practice or whatever that is. The second
one is having really deep understanding
of a uh of a space in terms of go to
market. And so, you know, when you think
about what the labs are going to do,
our, you know, our product team is
actually not that large. We really focus
on both our horizontal platform and then
a couple of really key sort of vertical
bets where we feel like we have
something to add or we have a lot of
expertise in it. So coding is one of
them and then just general knowledge
work is another one given that we have a
bunch of knowledge workers already
inside anthropic right we're not going
to develop that same go to market
expertise on in the legal domain in the
medical domain etc. That's where we will
either partner or just love to see
companies emerge from the platform. So
that's the second piece is you know can
you actually like come connect to the
right companies make the right
connections and then the last one is is
probably the one that is I still have
the most questions on which is
differentiated data uh because you got
this lot of question you know a couple
maybe a year ago the whole story was
well we're going to build a agent
company in this domain because we have
some sort of data advantage to it and
we're going to do a fine-tuned model we
still see that you know fine-tuning
helps a bit but the next model
generation basically blows away the the
the fine-tuned things even internally
we'll try interesting finetunes only to
find that the
model generation helps. I think what is
is is maybe the more sort of sustainable
data story there is less we're going to
fine-tune a model on data and more that
we have some sort of data advantage that
we can connect to the frontier models.
So for example, we work with a large
insurance company. They have a 100 years
of underwriting data. They've connected
it to cloud for enterprise using MCP
that's proprietary like that's a
proprietary data source that I think is
really interesting. So data not for a
fine-tuning sake but for you know
bringing into context and and improving
the results I think that's still
sustaining
&gt;&gt; like you need data plus like an outcome
and then with claude's kind of agile
vision you're able to get the right
outcome faster and better.
&gt;&gt; Exactly. One thing Mike like I was very
excited to ask you is that what is the
philosophy of building an agent AI
product right like you you did it before
with Instagram story like your next
product and now we are in this AI wave
in software you just wrote a line of
code or few lines of code you wrote a
unit test if it worked it worked L&amp;Ms
are non-deterministic a lot of times it
can get to a wrong answer so what is the
philosophy here then
&gt;&gt; I think we look at a couple of things
and some of this will evolve as the
models become more capable but I think
ering on transparency is definitely the
way to go at this stage, right? Even if
not every user is going to want to go
super deep into like what were the five
steps at the 20 steps the model took,
having the ability to sort of telescope
into that I think is still really
important. I think a lot about like what
is the ultimate form factor will
interact with agents. I think it's
probably going to be they're going to be
in your Slack or your other
collaboration tools and you'll talk to
them and they'll respond but and you're
not going to have to worry about in the
same way that you have to ask a co-orker
a question. You don't ask them to sort
of explain their thinking step by step.
It'd be very tedious. I don't think
we're there yet for a lot of these use
cases. So, it's still valuable
especially in remediating errors and
say, "Oh, I see where they went astray
or oh, they were missing this piece or
it was useful to see the thinking
process." So as an example, we have some
internal um agents deployed inside and
uh what they'll do is they'll start a
thread with themselves. It's kind of fun
and then they'll basically like put all
their thinking and tool calls and MCPs
in the thread and then they'll respond
with the final answer kind of in the in
the sort of route and that kind of
illustrates that sort of process. So
transparency I think is a a big product
principle that we um that we look for.
And the second one is really having, you
know, I talked about eval a little bit
before. That's another one where in
dealing with the non-determinism. Um,
you can't just push the pixels and you
can't just sort of prompt it perfectly
once and be like, great, this is
deployable. You really have to, you
know, open it up to people, see how
they're going to prompt it, uh, see how
they even try to use it before you know
whether your product is actually sort of
serving that need beyond just, you know,
in your idealized like if I click it and
I ask it this exact question, it's going
to go well. So that's that's the other
piece like transparency and sort of
robustness um and adaptability um which
really comes from a combination of evals
but also just user testing like we have
a really rich user experience research
kind of discipline inside Anthropic and
I think that's become more important
rather than less. Before we move on a
quick message from our friends and
partners at Vanta startups move fast and
with AI they're shipping even faster.
That means startups are attracting
enterprise buyers even earlier and the
right kind of security can make a deal
or break it. Vant's AI and automation
make it easy to meet buyer expectations
in just days. Their technology
continuously monitors your compliance so
your deals are never blocked. With AI
changing regulations, Vanta knows what's
needed and when. And they've built the
fastest and easiest path to get you
there. Listeners of our show get a
special $1,000 discount when they sign
up. Just go to vanta.com/suphum.
That's va.com/suphum.
And how do you think about design and
UIUX right like obviously chat is the
primary uh interface now we also are
started seeing voice and now you know
Meta obviously launched a gl glass
glasses as well what do you think about
design as this thing hi evolves
&gt;&gt; I think there's going to be two really
important like roles design plays one is
brand and and feeling like you're at
home within an environment and it's
something I think a lot about I'm also
on the board of Figma and um you know
the the importance of brand and of
feeling like you were using a product
that is both intentional and cohesive
with the rest of an experience that a
company is providing like remains very
important right if you prompt claude out
of the gate has kind of a house style if
you will um but if all software looked
like that one it would be super boring
but two it'd be very hard for you to
feel like this is my product that I'm
using you know I I now get that this is
uh a different surface I'm going to
trust it differently so that's one the
second part is there's a tremendous
amount of work still to do in the design
you know kind of process around how do
you make AI products understandable to
people, right? Where um relying purely
on conversation doesn't feel right
either. So, um you could have claude
just prompt every time and say and ask
in textual form, hey, should we connect
your Google Drive, you know, but then
it's like, well, I'm going to give you a
link to go click on something. So,
there's still a lot of processes that
maybe are AI initiated but require good
design in order to make them
understandable. And I think there's
actually a place where we have a lot of
work left to do is um the product has
gotten more complex over time like
there's MCPs, there's advanced research,
we like virtual machines in cloud for
enterprise now too. How do we make all
of that really like hang together and
sing? You can't just rely on text. I
think that is a place where you need uh
more of a design forward vision. um uh
in in relation to the LLM and at the
same time um you going back to the
previous conversation it's important
that designers also not operate from a
place of like perfect golden path and
also know that people might arrive at
whatever kind of stage because they were
talking to Claude and Claude suggested
something and then they pressed a button
and so the the sort of non-determinism
infects the design process as well.
&gt;&gt; Yeah, I just have a quick followup on
that on the design part, right? I just
want to get a little bit more specific
on that. In some domains like social we
saw like scrollable feeds as a high
level like you know very strong design
pattern that still continues to today
even like the more recent huge successes
like Tik Tok are still taking the
scrollable feed and that's just been
like the the winning highle design
pattern there
with chat and AI is chat do you feel
like you know chat is just so large and
overwhelming that this is just going to
be the paradigm for for a lot of these
AI products moving forward or do you
feel like no like you know this is
probably going to get disrupted very
soon and chat is probably not going to
be the dominant way of interacting with
AI five or 10 years from now.
&gt;&gt; I really changed my mind on this when I
came in, you know, even as I was having
my initial conversations with Enthropic,
I came in, it's like, I can't believe
we're still chatting with AI. Like, what
are we doing? Uh, you know, we there
should be better UI paradigms. And I
think for some disciplines there there
will be. I think what changed my mind is
that at least so far these like
different UI paradigms, workflows or you
know something that's like more
segmented or like even just in time UIs
tend to be more constraining of the
model rather than sort of unlocking of
the model. And I think what really
changed my mind was watching people
start using cloud code not for coding
but for solving their own like research
problems or managing their to-do lists.
you realize like oh the flexibility of
you know basically providing live
instruction to the model and then
figuring out how to connect the right
data behind the scenes is really
powerful still and so I think at least
my prediction is a lot more of the
innovation will happen within chat
around how you either delegate whole
work to claude or to any of these models
seeing how they're doing thinking about
how they're planning multiple steps
ahead right there there's definitely
abstractions to be built around the
fundamental concept of a conversation
but I've evolved from thinking that you
know it's a you know error in you know
the tech tree that we've ended up with
conversation as the main way we interact
and realize more that it's actually a
pretty natural way where most people get
it. Now the thing that needs to evolve
is um uh it's not just about like a
turnbased back and forth when you're
just kind of doing like lightweight
conversations as the work evolves and
starts taking on longer and longer it
will feel more like talking to a
co-orker and you know it's going to feel
more asynchronous for example and I
think that that's a trend that you'll
see.
&gt;&gt; Awesome. Awesome. So Mike, we all know
like you know like an assumption is
being made that hey models are going to
keep getting better but beside that
assumption if I'm a builder what are
some reasonable things for me to assume
over the next 12 months with the uh from
from your perspective?
&gt;&gt; I think one and it's maybe good to like
click down a level into how we expect
them to get better. There's of course
general reasoning and ability to write
code but I think like when I think of
like two or three trends that I think
are very interesting in that dimension.
One is the ability for models to use
tools really robustly. So um you know if
you're not an active builder just think
of it you know give claude a tool. It
could be a web search tool. It could be
a write file tool. It could be a um you
know call Google drive or uh you know uh
one drive kind of thing. So those are
all like tools that you might give the
model. And a year ago when I first
started sort of building products around
the models they were able to use a few
tools effectively but as soon as you
gave them a bunch it really started
struggling right. Um, and so one
interesting evolution is, you know, then
they could handle dozens of tools like
45 can handle even hundreds. We wanted
to push that even further because for a
real true general purpose agent, if you
think about what a human does and
employs in their day-to-day work, they
might use a number of tools. They might
use websites, they might use browsers,
they might use Slack, they might make a
phone call. So um, that robustness is
going to be really important. And so
that's one sort of active area of
research for us that I think will
manifest in products as well. The second
one is multimodality primarily on the
input side and to some degree on the
output side as well with things like
speech. So um right now with things like
computers the model can look at a
computer and kind of react but the thing
we want to eventually unlock is like
claude should be in your Google meet as
a participant right not as just a AI
noteaker. Everybody's AI note takers but
it's sort of like more actively
listening and understanding when to be
proactive. So I think what that means
from a tech tree perspective, one is
being able to be multimodal in terms of
inputs and outputs. But the second one
is actually knowing how to be sort of
socially aware, right? You don't want a
thing that chimes in every 5 seconds.
You also don't want something that only
responds if you like at Claude or ask,
"Hey Claude, what do you think about
this?" Um, you want that sort of
balance. And you'll I think you'll see
the models um continue to to improve
there as well. And then the last one is
models being able to stay coherent and
track state and memory over time. So uh
rather than relying as we've relied on
the current architecture around like
stuff it all in context and maybe you
can do some context management and
compaction ideally that is something
that end users especially end users but
even developers don't have to think that
much about and becomes much more about
the model sort of self-managing its
context and memory over time. 4.5 is our
first model that can do more of that.
It's how it was able to work for as long
as it was able to work in these in these
tests. But going forward, I think that
should just be table stakes for how any
agent operates. No,
&gt;&gt; I love like the context editing
capabilities with memory ability for it
to like take out things from its context
and which have been used that that's
that's amazing. And for audience who are
not kind of uh aware of like you know
memory and context like models have
context windows and if you they kind of
end up degrading over time and Claude
has in this new 4.5 model launched
something which allows you to keep
updating it which is amazing. Uh so Mike
from from your perspective if I'm a
builder what's the best way for me to
leverage this memory capability as well
because I think this is pretty powerful
uh to build new products and opens up a
new frontier as well. We initially had
kind of described this memory capability
more in terms of like cookbooks or
examples and the thing we decided to
build um as part of 45 is actually
making it a first class sort of
construct in our in our platform and
we're going to do that more and more
where um if the primary way you were
interacting from a developer side with
cloud was give us some input tokens
we'll give you some output tokens like
very much a kind of simple in andout
we're starting to see uh the value of
actually building these as abstractions.
So if you're a developer today and you
um either have user specific memory,
right, because you have a bunch of end
users or you're building more of a
general purpose agent that might
interact with a lot of people, you can
kind of scope memory to the right level
of um of abstraction or of use. Um and
then with these APIs actually have
Claude dynamically read, write, and
update memory so it can bring the right
pieces of context into its uh into its
context window. In other words, it knows
when to bring in the right information
at the right time. Not in a way that
feels disruptive or artificial, but also
not in a way where you're having to do a
lot of that management yourself. So,
that's a lot of what we're doing. And
maybe as like a a broader point, we do a
lot of of sort of specific things in
cloud's training. And we're trying to
find the right ways of opening up that
those sort of uh tools to developers as
well. So whether it's uh how it manages
memory, how it thinks about files, even
how it thinks about some of these coding
tools, I think you'll start seeing us
more and more make those available so
that as an end developer, you can get
the best-in-class performance.
Basically, if you can get as close to
how the model is actually trained, it
usually improves the performance too. So
Mike, one thing I wanted to get your
perspective on is that do you think we
are hitting a certain limit or ceiling
in our existing paradigm when we have to
think about new models or architectures
like the word models people are talking
about? How do you guys think about this
at Anthropic? I think for the the kind
of critical path of what we think about
which is building general purpose agents
um that can do productive work alongside
people, there's still a tremendous
amount of of room to run within the LM
architecture. You just saw it even with
the scale up. I mean the fact that you
compare our model, you know, Sonnet 4.5
today with Sonnet 4 that we released in
the summer, there's already significant
improvements. You compare that to Sonnet
3.7 which we released in February and
the another leap. So still feels like
there's a lot of room to run there as we
continue to scale up our reinforcement
learning and and perfecting that
process. And I also think there's going
to be room for um models interfacing
with each other. So you know, as we
think about how Claude can play a role
in the life sciences, for example, I
could absolutely see Claude work as a
coordinator with more specialized models
that are maybe doing some kind of
protein analysis or protein synthesis.
And um there can be a really nice
orchestration between the two. You also
don't want the protein model necessarily
to have to worry about tool use for
thousands of tools. it's like pretty
orthogonal to what what it might be
might what it might be doing. So I think
you'll see more of these uh like
orchestration plus submodel
architectures. You're already starting
to see it with like claude you know
maybe opus and sonnet we saw that in the
previous generation in the future you
might see it sonnet and you know a
specific model that is uh tuned to maybe
biology for example. So that's the kind
of evolution I think you'll see. I um am
still a believer in the sort of
coordinating node being you know that
that sort of like meta agent really
being focused uh on a sort of LLM plus
RL architecture and that's what we'll be
focusing on.
&gt;&gt; Enthropic obviously I think cares about
like reasonable scaling as well and
really in safety. One question I have is
how do you avoid bias in the training
data because we are at the end of the
day trained on human generated data and
there could be bias there. Yeah, we
think a lot about this um primarily
through our constitutional AI. So if
you're not familiar with how
constitutional AI works, we uh uh rather
than sort of rely on very specific
decisions made during the training
process that are sort of opaque, we
actually publish the list of of
principles we want our AI to operate
under and you can find find these on our
website. And then what we do is we have
Claude actually generate a bunch of test
cases and then another Claude uh grade
how well a particular model is at um at
fulfilling those things. And you'll
start seeing that you know uh it's
impossible to have a model that is like
you know has zero bias in any direction.
I think it'd be hard for it to say
anything at all. But at least we make
clear sort of what are you know what are
the principles that the model is being
being trained under. you know can be
prohumanist can be generally pro you
know uh a certain set of things and
rather than trying to be like I'm never
going to express an opinion about
anything which in that case wouldn't be
a very very useful model so I think it's
an interesting uh sort of process that I
I wish all the labs had which is what
are the sort of basis for how it makes
decisions and that isn't to say that
it's going to be biased towards one
political party or another hopefully
there's a lot more nuance to to built
into that that we that we seek there but
it's more around um like having some
perspective on things while also still
being able to sort of argue the the
point from both sides and engage uh in
uh sort of that sort of steelmanning of
of any viewpoint.
&gt;&gt; Awesome. I'd love to ask you a little
bit about the the consumer side of
things as well. Obviously, you know,
there's uh there's Gemini, there's chat
GPT, there's other chat bots as well.
when you think about the direction of
the company, right? It's like yes, like
there's an amazing consumer product
there, but then you're also doing so
well on the enterprise side and I
believe most of the revenue growth if I
if I I believe the reports is coming on
the enterprise side of things. Do you
feel like Anthropic is like an
enterprise first company now or how are
you sort of like balancing these buckets
in your head? Yeah, I would say that the
focus is definitely on on I would say
work more broadly with the emphas with
an emphasis on you know selling to and
being really enterprise friendly but I
think it's also important to uh make
sure that we have like an entire
pipeline of of folks from uh discovering
our products you know outside the wall
of the enterprise you know we hear all
the time about people that played with
cloud code on the weekend got really
excited and then on Monday bring it into
their company and say like oh we we
should adopt this or we should try this
out and so that sort of productled
growth is still really important even
with an emphasis on work and also
there's a lot of uh sort of personal use
cases that tend more towards the work
right whether it's you know managing a
crazy school calendar if you're a parent
or thinking about your next career move
or doing you know productivity work
within your own domain so I would say
like work is the through line we have
definitely less of a consumer
orientation than something like chat GPT
and like a lesson I learned watching
Instagram grow is you know once you hit
that sort of like consumer escape
velocity until there's another like turn
of the wheel another cycle It's very
hard to displace another product by
going directly at it. So even coming
into anthropic chap was already a very
large product. You could see that that
product could probably hit some sort of
consumer escape velocity for at least
this kind of current generation of
interactions and there was you know an
equally large I think business to be
built on more of the enterprise and work
and productivity side. So that's been
more of the it's also more aligned to
what we're trying to do in the long run
in terms of these general generally
capable agents towards powerful AI. So
it all aligns well. Um but then also you
know there are people who use cloud just
for things that are purely personal and
I think that that's uh that's great as
well. So it's not so it's certainly not
something that we're like excluding but
the emphasis from a product development
and and just general go to market
perspective is much more on the work and
enterprise side.
&gt;&gt; Yeah. One of the strange things I I
notice about chatbots and I think claude
specifically cuz cuz that's probably the
one that I'm using the most these days
is besides Google search this is the
only product that I'm using both for
work and personal stuff cuz you know in
the morning you know when I'm working I
always have it open in the background I
have like couple you know I'll have Chad
GPT open for you know just to get a
second opinion on things as well but
then you know at night when I'm like you
know u you know we're planning a trip
right now with my wife right now or you
know for example you know when she has a
headache or something, she's always, you
know, opening it up and, you know, we're
comparing notes on on what symptoms
showed up and so on. It's one of those
few products where I feel like it kind
of goes goes both ways.
&gt;&gt; We've definitely seen that where also
you you find that there's um you know,
use cases that you wouldn't even have
thought of, but then because you've come
familiar with the tool, you start using
it personally like uh my wife and I were
cleaning out our liquor cabinet. You
know, you like accumulate these things,
you throw a party once, you have all
these things, and we're like, what can
we make with this stuff? Which is a
great example. But the other one we did
was like some of these bottles are nicer
than others, but we don't want to like
throw away or like gift something that's
like not uh you know something that we
should keep. So we actually just took a
photo of all the labels and just had
Claude go through one by one and say and
it was like oh this one's actually like
super rare. You should like definitely
keep that. So uh you know it's
definitely a very personal use case that
only because I was familiar with its
image capabilities did I even think
about that.
&gt;&gt; Absolutely. Absolutely. I you know I'd
like to sort of know just expand on that
and you know take the conversation away
from how other people are using it to
how you're using it. Like one of the
great things about you know these
conversations is folks like me but all
the audience as well get to see how
folks like you who are on the cutting
edge of the technology are using it. So
just love to hear how you're using maybe
cloud or any other AI tool on a
day-to-day basis whether that's for work
or for your personal stuff. I'd say the
sort of overarching like question I ask
is like can I claude that or like can
claude do that for me and I actually
credit my wife for helping me see places
where I wasn't even applying Claude to
things where it's you know she'll like
watch me do something manage she's like
why don't you just ask Claude to do I
was like oh that's a really good point
you know like I don't need to you know
individually check every single one of
these email addresses from you know our
school party invite we can just have
Claude like look at the CSV and then
like create the output so it's a lot of
like sort of a mindset shift kind of in
a on a daily basis. I think there's a
few different ways. One is any kind of
product work that I'm doing where I'm
like writing strategies like refining
them um uh like iterating on something
like my first port of call after I've
kind of taken an initial draft is to
really use cloud as this kind of back
and forth conversational partner like
what am I missing? Please poke holes in
my strategy like what should I add? What
are some of the objections that you
might imagine to this? And often you're
like wow like that like I just hadn't
thought of it. even you know especially
if it's something you've written your
blind spots are very easy to miss uh
because you've you know been the creator
so having Claude be that uh sort of
critic conversational partner I think is
is really really important. Um getting
smart about things I often like will
lean on Claude as well whether it's you
know either a concept in in AI that you
know we have some of the smartest people
in the world working here like pushing
for the frontier um and if I had to bug
them every five minutes to like ask them
like what did you mean by this uh you
know I'm sure they'd be happy to explain
but it would not be necessarily the best
use of their time. So getting smart
about something. What I found there is
is cool too is um because cloud can also
visualize things. It can create charts
and graphs. It can even create
presentations. Now asking for
explanations in different formats can
yield some interesting results, right?
We had uh uh one uh of our designers
who's trying to understand this like
research concept recently and he had
Claude just like create a whole like
process diagram thing and he's like ah
it clicked for me. So that I think is
interesting like different people learn
differently and Claude can adapt that
that sort of explanation to to where you
are. um which I think is great. And then
like on a more personal side, any kind
of research piece, whether it's, hey,
what should we watch next? Like what
shows are we missing that we haven't
seen yet? I've read these three books
recently. What else should I be thinking
about? Um we're traveling somewhere new
similar to you. And you know, having
that sort of like what, you know, what
are some like off thebeaten path things
that I might do or like I love really
niche weird museums. So being able to
ask Claude like hey like what are some
uh uh some places that I might visit? It
sent me to this super cool place in
London that was this like house uh meant
to look exactly like a family might have
inhabited it in like the late 19th
century. Like I never would have found
it on my own. So that's the kind of
personal to professional and back that I
uh that I tend to use it for.
&gt;&gt; Awesome. Yeah. I one of the things that
I'm using most for is just to get
feedback on stuff because I feel like
you know since I'm managing a team I
feel like sometimes you know there's
always this dynamic where people who
report into you might not want to be
brutally honest with you and and hurt
your feelings. But I have a project
within cloud which is just you know like
the brutally honest mentor and I'm
always like you know just give me this
advice and I was I never like said it
out loud on any of these podcasts or
even to my team because I was like it's
probably going to look weird that I'm
sort of you know taking notes from an AI
on how to run my company. But then we
had Mark Beny off uh on the podcast and
he basically said you know he's like hey
every time I need to make a big decision
I always go to all the chat bots and I
paste a document. And I always ask her
for feedback and I was like, "Okay,
cool. Good to know." Great.
&gt;&gt; This is a legit for for running a
company now.
&gt;&gt; I love that.
&gt;&gt; Yeah. Be, you know, beyond just just,
you know, how you're using Claude, are
there any products outside of Claude or
the stuff that Anthropics build that
you've really liked?
&gt;&gt; I've actually like one I like when uh
new generations of technology make the
old approach like completely irrelevant.
So, you know, I've been trying to log
meals like from, you know, probably for
20 years. And, you know, there were
early apps that would do that in the app
store and then there was like things
like My Fitness Pal. And it's been very
cool to see how, you know, a lot of the
work that people are doing around like
image segmentation to try to detect
portions. It's like you can just feed it
to an LLM and it's actually going to be
very good at detecting these things. So,
I've been using levels a lot and levels
I think has the best uh sort of image to
portion size and macros. I'm trying to
track my protein like um uh
implementation that I've seen and it
like it it took an activity that was a
pain in to do every time. You know,
you're like, I'm going to weigh this
stuff and it's not 100% accurate, but
it's close enough where and disrupt and
uh minimally disruptive. It's like very
fast to like take a fast photo of
something, put it something back in your
pocket, trust that later it's going to
be like great, here's the breakdown of
all these different, you know, this
portion, etc. That one is is something
that I use all the time and it's in like
a a really rapid thing. The other thing
I've been excited about is just voice in
general as an input mechanism. I like um
I think I don't know I'm getting older.
I like typing less. Uh and I like uh
just sort of dictating my thoughts. So
um I even had like a a long talk to
give. Uh it was like a 30-minute talk
without slides recently. And the way I
actually prepared for it is I I drive to
work and back every day. I would just
have like uh I would just uh talk to
this like a super whisper one of these
apps where I just like talk and talk and
talk have it like internalize it and
then you can actually opt optionally
then run it through an LLM to like ask
you questions or synthesize it and that
was really valuable and then my last
like talk related thing that was really
fun was I'd written this talk and you
know it's hard to hear a talk in your
own voice or like read it all out and
understand what feels clunky so on my
way to the actual conference I had I put
it in 11 labs and I said hey please read
the talk to me. Um, and it did and it
was like such a cool way of actually
hearing your own and it very quickly was
like, "Oh, that part's clunky. This part
feels slow. I'm bored here." You know,
if you're bored of your own talk, it's a
bad sign. Um, and that was like a a real
like total game changer in how I prepare
for talks now.
&gt;&gt; Awesome.
&gt;&gt; That's super cool.
&gt;&gt; Love love love that example, Mike. Like
one one thing like with clot code I was
I've been thinking about you know over
the last 12 months coding agents have
really really improved and I I've just
been very excited with 4.5 with clot
code like it just suddenly like I'm like
hey like holy like it seems seems a
significant improvement and if I'm a if
I'm a founder and I'm raising like5 to
10 million I don't like really need that
much money to hire that many engineers
right truly like cloud code feels like
you can have a principal engineer and
they can have a team of like three to
five developers and they can all run in
parallel and it can really get things
done. As an example, the project uh we
did with cloud core 4.5 would have taken
us 6 to 8 months ago close to 3 to 5
days with one engineer. It took us less
than a day which to me was phenomenal.
&gt;&gt; Yeah.
&gt;&gt; So from your perspective, how should
companies now start thinking about their
technology teams and how should be folks
who are trying to get into the
technology sector be thinking about
getting into it? I think the um impact
is going to be first much more felt on
that startup side for two reasons. One
um often you don't have like an existing
codebase. I feel like even the best of
our models are good at making changes in
large code is not as good as here the
zero to one kind of process when you
know something is almost like built by
cloud is able to be iterated on by cloud
a little bit better. Um, but I think
that sort of, you know, startup, even
the midsize company. I was talking to a
founder today and he was really excited
about how, uh, you know, being really
clawed first in their development
process has helped them um, maintain
that cohesion. Like at Instagram, we
definitely had that, right? We were a
small team. We really like had that, you
know, tight cohesion uh, in the team and
and he felt the same thing as well where
it meant, you know, the company was able
to move more nimly as well. In terms of
the like the the sort of larger the
larger company piece, I'll speak for
anthropic like we're definitely still
hiring engineers and growing our tech
team. So, it still feels like we are on
the at least for us like the upswing of
like needing more talent. And I've asked
myself, you know, the models have
definitely made teams more productive.
So, what is going on? And I'd say
there's probably a couple things. One,
our portfolio has gotten wider and so
there are more people working on
distinct things. Um, two, there's
actually a lot of, you know, non-coding
work in software engineering, right?
There's the planning process. There's
the debating the right UX for something.
there's the bug fixing and bug hunting
and being in these in these pieces and
those
still a very like sort of inherently
human activity in a lot of those ways
and so that is still another piece as
well. Um and then the last one really
comes from uh when it comes to things
that projects that are beyond code. So
we're we have sign in with a very
speific we have signin with Apple on our
iOS app and we need to add it to the web
version like that process the code
actually I think cloud could probably
oneshot even within our codebase but to
actually fully do it you got to probably
log into like the Apple developer
account and provision it got to
provision there's definitely like more
steps there as well and so until we
fully unlock that sort of uh endto-end
browser use piece I think that there's
still like a a sort of back and forth
that you'll need with the models um in
terms of advice I think a A couple of
things matter. One, um, the non-coding
skills, as I mentioned, end up being a
big part of increasing part of the role.
And so, um, leaning more towards not
just, hey, I was able to like use these
tools to build something awesome, but I
actually did that with a small team or I
like I, uh, I loved I was talking to
somebody recently and they, uh, set up
this whole portal for their university
as part of like their kind of student
work. And I was like, okay, great. That
means you had a customer and you had,
uh, you know, an audience and you were
building these things. I think that's
much more important going into the
workforce now than just I created this
super complex project that I did all by
myself. Um and the second one is um
being really curious about the user
experience side of things. Like that is
definitely still a big human comparative
advantage I think of where how the
product should behave, how it should
work. Like I love you know when I get to
work with engineers here at Anthropic
that are very user centric that say
great like we can we can do this in
three different ways. Here's why I think
we should do it this way. I tried using
it. I hit this you know bottleneck. I'm
seeing this in the user reports. Um, so
that sort of, you know, ultimately
software is being built for humans at
least for the next while. Um, and then
as long as that's the case, I really
like lean on like people who have that
sort of UX taste even as engineers.
&gt;&gt; That's very helpful to understand. One
one thing I noticed in the new model was
that the computer use
uh benchmark really jumped compared to
like the other models. Was there some
significant improvement in the data
which was collected for that or there
was what was the breakthrough which led
to like it being in the 40s to close to
60% now? A lot of it just you know came
through better training. I would say
that the thing that still feels like
it'll unlock the next leap is better
vision. So, um, you know, thing that
we'll continue to push on and emphasize,
like 4.5 already has some improvements
here. We'll continue to push even
further is, um, how well can the model
see, not just beyond, you know, it can
generally see the screen and understand
what's going on, but I wanted to be able
to feed it all of our designs and all of
our UIs in there and have the model be
even more annoying about UI details than
me. Um, not because that those are the
only things that matter, but because
it's really showing that it's, you know,
able to close that loop really well
around like what it creates and then
what it sees as well. But a lot of the
improvements in 4.5 really came from um
better training, more examples. Um and
we also put a lot of work into making
the model more robust to jailbreaks and
prompt injection, which are two sort of
risks that we we pay a lot of attention
to when it comes to browser and computer
use. Um because we really think that to
fully unlock that capability broadly,
we're going to have to be both build
very powerful but also very sort of safe
and and trustworthy models for those as
well.
&gt;&gt; We talked a little bit about computer
use. What are other things since you're
so closer to the technology that you're
super excited about over the next 6 to
12 months? Um, I asked this from a
selfish perspective as well because
we're building products in general. So,
I'm always trying to figure out like
what's going to happen in 6 months from
now or 12 months from now and what
should we really focus on on building. I
think the like the way I I scorecard
this um I created this you know internal
um kind of view on what are the missing
pieces that we need to push on to really
get to the point where we have a
credible sort of virtual co-orker right
and I'll name some and then talk about
some of the improvements that I say one
is proactivity and we talked a little
bit about how these models are getting
better at being proactive and kind of
socially aware I think there's still
more like work to be done and when they
get there it's going to I think be
notable I 4.5 is actually by far the
model we've trained that has the uh best
ability for example to be in our shared
Slack and actually know when to chime in
or not but you still have to give it
some instructions like no you're being
too proactive like scale it back a
little bit but at least it can follow
those instructions um autonomy and
memory I think that you'll continue to
see that that um push even further be
able to not just connect the right data
sources but also even write the
connectors to connect to the right data
sources so we're seeing the model not
just be able to be really really good at
using MCPS but also So we have a whole
project internally we call autoMCP where
like given the right spec it's able to
actually just write the integration and
then put it you know uh into a review
and then we can deploy it um safely in
there as well. I think that's going to
be like another really important piece
too. Um and then last one and it touched
a little bit on this on the browser use
side but it's really the models ability
to you know be multimodally in the same
spaces as we are right so in their
conversation you know what will it be
when they'll be on our you know future
uh podcast like having uh claude that
can actually both chime in because it
can listen to it can it can be in a sort
of full duplex scenario where it can
also respond to what's it's seeing on
the screen like that is not there yet
but when it emerges will feel very
magical when It's like there is voice,
there is vision, there is computers and
all those modalities blend together.
That'll be the tipping point I think for
a lot of these like more productivity
oriented use cases.
&gt;&gt; Awesome. Awesome. This has been like a
fascinating conversation so far. I want
to sort of you know end the conversation
by asking about it like just like zoom
out a little and just see you know sort
of see what's happening maybe on a on a
decade or decades long scale. When I
think about AI, you know, I think the
most one of the most, you know, dominant
aspects of it is just how much leverage
is enabling. I think, you know, when
folks on, you know, in our Twitter
bubble talk about, you know, leverage
and so on. I think Instagram is one of
the classical examples. Less than 15
people got acquired by, you know, for a
billion dollars, used by billions of
people today. Very small number of
people were able to do an incredible
amount of, you know, uh, stuff with, uh,
with, you know, essentially with the
power of code. We're now seeing that
trend accelerate with, you know, these
coding models, everything else that's
happening.
When you try to look maybe 5 years, 10
years, even maybe one or two years in
the future,
what does a fully leveraged individual
look like to you? And what does a
society look like to you where we have
so much leverage available for everyone?
&gt;&gt; Yeah, I'll paint both one of our
anthropic um sort of company values is
hold light and shade. So, I'll I'll I'll
try to hold light and shade here as
well. I think in terms of sort of that
positive leverage, you know, I've seen
even in its initial kind of um stages,
you know, um
not every company is going to be able to
hire the world's best CFO, the world's
best uh sort of product person, the best
strategist, etc., especially not in the
early stages. And I think a really cool
moment and a really like high potential
like leverage moment is bringing those
capabilities. And is Claude better than
the best, you know, lawyer, the best
CPO? Definitely not, right? But is it
like better than sort of just pure first
principles thinking for somebody that
doesn't have experience like also no,
right? And so uh upleveling those
disciplines within startups and small
businesses is going to be I think very
impactful on just the world economy and
how things get built and how companies
get can scale. So that's I think a
really high potential there too. Um I
think that might look initially as
people if they're doing side businesses
or starting companies or expanding their
SMBs. I think those are all promising
areas. I think the risk is that it can
actually make us lonelier, right? Where
even within Anthropic, we think a lot
about this. Um, people have scaled up
their cloud code users. You can imagine
we're probably the most cloud code, you
know, sort of using organization in the
world, although some of our customers
are giving us a run for our money there.
Um, one of the things we found is that
people are more productive, but they're
also less connected. And so we're really
actively talking internally about how do
we like take that learning and then
figure out ways of creating connective
points between people even when they're
not asking each other technical
questions as often. Right? I mentioned
earlier I use cloud a lot for uh sort of
figuring out how to get deeper on some
of these research topics. But how do I
make sure I still stay connected to the
research team? you know, like I've
started hosting dinners at my house that
are actually we pick people from all
across the company and then bring them
together and everybody's like, "Oh, I
didn't know this person was working
here." And like it's just a cool
connectivity. So, I think we will have
to as companies and as society reinvest
in those uh moments of connectivity
because the technology that was maybe uh
not there for, you know, facilitating
those or or necess.
&gt;&gt; Is there anything else that's top of
mind for you that you haven't had the
chance to talk about today? I think
maybe I'll like leave with one piece
which is like maybe the kind of founding
thesis of anthropic is that we can build
like extremely powerful models but do so
safely. And it was just a very cool
thing for me to see come together.
Especially with Sonet 4.5 where like
basically on every metric that we look
at from a like aic behavior and
capability side we improve. But it also
is our safest model yet like the least
jailbreakable. Um the like you know the
one that is like most honest like the it
basically like scores well on both
evaluations and um our sort of goal and
my hope is that we can continue to push
both of those frontiers at once.
&gt;&gt; Awesome. Awesome. Amazing. Mike, this
has been enlightening. definitely like
the best conversation we've had in like
the 40 45 episodes that we've done for
this podcast. So yeah, just wanted to
say thank you so much for for making the
time for us. Thanks for having me. This
is really fun.
```
