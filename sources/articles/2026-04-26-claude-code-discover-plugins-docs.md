---
url: https://code.claude.com/docs/en/discover-plugins
date: 2026-04-26
author: Anthropic
type: documentation
fetch_status: fetched
---

# Discover and install prebuilt plugins through marketplaces

Official Claude Code documentation on plugin marketplaces. Source: code.claude.com/docs/en/discover-plugins.

## What a marketplace is

A catalog of plugins someone else created and shared. **Two-step**: add the marketplace (registers the catalog), then install individual plugins. Adding ≠ installing — "like adding an app store: adding the store gives you access to browse its collection, but you still choose which apps to download individually."

## Official Anthropic marketplace

`claude-plugins-official` — automatically available when Claude Code starts. Browse via `/plugin` → **Discover** tab, or at claude.com/plugins.

Install from it: `/plugin install <name>@claude-plugins-official`. Example:
```
/plugin install github@claude-plugins-official
```

To refresh: `/plugin marketplace update claude-plugins-official`. To add if missing: `/plugin marketplace add anthropics/claude-plugins-official`.

### Plugin categories in the official marketplace

**Code intelligence** — LSP plugins that give Claude jump-to-definition, find-references, and auto-diagnostics after every edit. Languages: C/C++ (`clangd-lsp`), C# (`csharp-lsp`), Go (`gopls-lsp`), Java (`jdtls-lsp`), Kotlin, Lua, PHP, Python (`pyright-lsp`), Rust (`rust-analyzer-lsp`), Swift, TypeScript.

**External integrations** — pre-configured MCP servers: `github`, `gitlab`, `atlassian` (Jira/Confluence), `asana`, `linear`, `notion`, `figma`, `vercel`, `firebase`, `supabase`, `slack`, `sentry`.

**Development workflows**: `commit-commands`, `pr-review-toolkit`, `agent-sdk-dev`, `plugin-dev`.

**Output styles**: `explanatory-output-style`, `learning-output-style`.

## Demo marketplace

`anthropics/claude-code` — Anthropic's example/demo marketplace. Must be added manually:
```
/plugin marketplace add anthropics/claude-code
```

## Installation scopes

| Scope | Applies to |
|---|---|
| User (default) | All your projects |
| Project | All collaborators in this repo (written to `.claude/settings.json`) |
| Local | You only, this repo |
| Managed | Set by admins, cannot be modified |

After installing, run `/reload-plugins` to activate without restarting.

## Adding marketplaces

Sources supported: GitHub repos (`owner/repo`), any git URL (GitLab, Bitbucket, self-hosted), local paths, remote `marketplace.json` URLs.

## Team / admin features

Admins can push marketplace configs via `extraKnownMarketplaces` in `.claude/settings.json`. When team members trust the folder, Claude Code prompts them to install.

## Security

Plugins run with full user privileges. "Anthropic does not control what MCP servers, files, or other software are included in plugins and cannot verify that they work as intended." Trust the source before installing.

## Plugin submission

- claude.ai: claude.ai/settings/plugins/submit
- Console: platform.claude.com/plugins/submit
