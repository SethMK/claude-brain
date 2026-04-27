---
type: concept
status: draft
last_updated: 2026-04-27
sources: ["[[2026-04-26-claude-code-discover-plugins-docs]]"]
---

# Plugin marketplaces

Catalogs of prebuilt [[Plugins]] you can browse and install into [[Claude Code]] — like an app store for skills, agents, hooks, and [[MCP]] servers.

## How they work

**Two steps** — add first, install second:
1. **Add** a marketplace → registers the catalog with Claude Code (no plugins installed yet)
2. **Install** individual plugins from it

```
/plugin marketplace add anthropics/claude-code    # add
/plugin install commit-commands@anthropics-claude-code  # then install
```

After installing, run `/reload-plugins` to activate without restarting.

## Official Anthropic marketplace

`claude-plugins-official` — auto-available when Claude Code starts. Browse at `/plugin` → **Discover** tab, or at claude.com/plugins.

**Categories:**

| Category | Examples |
|---|---|
| Code intelligence | `pyright-lsp`, `rust-analyzer-lsp`, `gopls-lsp` (11 languages) |
| External integrations | `github`, `gitlab`, `slack`, `notion`, `figma`, `sentry` + 7 more |
| Development workflows | `commit-commands`, `pr-review-toolkit`, `agent-sdk-dev` |
| Output styles | `explanatory-output-style`, `learning-output-style` |

Code intelligence plugins give Claude **automatic diagnostics** (errors visible after every edit) and **code navigation** (jump-to-definition, find-references) via Language Server Protocol — no configuration beyond installing the plugin.

## Installation scopes

| Scope | Applies to |
|---|---|
| User (default) | All your projects |
| Project | All collaborators (stored in `.claude/settings.json`) |
| Local | You only, this repo |
| Managed | Set by admin, cannot be modified |

## Adding marketplaces

Supported sources: GitHub (`owner/repo`), any Git URL, local path, remote `marketplace.json` URL.

## Security

Plugins run with **full user privileges**. Anthropic does not vet third-party plugins — trust the source before installing. Organizations can restrict which marketplaces users may add via managed settings.

## See also

- [[Plugins]] — the packaging layer that produces installable units
- [[Claude Code]] — the host environment
- [[MCP]] — many marketplace plugins bundle pre-configured MCP servers
- [[Skills]] — plugins often package skills
- Source: [[2026-04-26-claude-code-discover-plugins-docs]]
