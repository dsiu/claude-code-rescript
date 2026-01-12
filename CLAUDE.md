# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Claude Code plugin marketplace for ReScript development. It follows a marketplace-as-container pattern where:
- The root `.claude-plugin/marketplace.json` acts as a plugin registry
- Individual plugins live in their own directories under `plugins/` (e.g., `plugins/rescript-lsp/`)
- Each plugin has its own `.claude-plugin/plugin.json` configuration
- Plugins can be installed individually or as a marketplace collection

**Official Documentation:**
- [Create Plugins - Claude Code Docs](https://code.claude.com/docs/en/plugins)
- [Plugin Development Guide - GitHub](https://github.com/anthropics/claude-code/blob/main/plugins/README.md)
- [Official Plugin Examples](https://github.com/anthropics/claude-code/tree/main/plugins)

## Plugin Architecture

### Two-Level Configuration

1. **Marketplace Level** (`.claude-plugin/marketplace.json`):
   - Defines the marketplace metadata and owner
   - Lists all available plugins in the `plugins` array
   - Specifies plugin sources (paths to plugin directories)
   - Categories and keywords for plugin discovery

2. **Plugin Level** (`<plugin-dir>/.claude-plugin/plugin.json`):
   - Individual plugin configuration
   - For LSP plugins: defines `lspServers` with command, args, and file extension mappings
   - Plugin version, author, license, and dependencies

### LSP Integration Pattern

LSP plugins in Claude Code use this structure:

```json
{
  "lspServers": {
    "<language-id>": {
      "command": "<executable-name>",
      "args": ["--stdio"],
      "extensionToLanguage": {
        ".ext": "<language-id>"
      }
    }
  }
}
```

The LSP server automatically activates when files matching the extensions are opened. Communication happens via stdio protocol.

## Development Workflow

### Commit Conventions

This project uses [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages.

**Format:**
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Common types:**
- `feat:` - A new feature
- `fix:` - A bug fix
- `docs:` - Documentation only changes
- `refactor:` - Code changes that neither fix a bug nor add a feature
- `chore:` - Changes to build process or auxiliary tools
- `test:` - Adding or updating tests

**Examples:**
```bash
feat(rescript-lsp): add support for .resi interface files
fix(marketplace): correct plugin source paths
docs: update installation instructions in README
chore: update dependencies
```

### Local Plugin Testing

Test plugins locally before publishing:

```bash
# Install from local directory
claude plugin install ./plugins/rescript-lsp

# Verify installation
claude plugin list

# Test during development (use --plugin-dir flag)
claude --plugin-dir ./plugins/rescript-lsp
```

For more on testing workflows, see the [official plugin development guide](https://github.com/anthropics/claude-code/blob/main/plugins/README.md).

### Adding New Plugins

1. Create a new directory under `plugins/` (e.g., `plugins/rescript-format/`)
2. Add `.claude-plugin/plugin.json` in the new directory
3. Update root `.claude-plugin/marketplace.json` to include the new plugin:
   ```json
   {
     "plugins": [
       {
         "name": "plugin-name",
         "source": "./plugins/plugin-name",
         "description": "...",
         "category": "tool|lsp|skill",
         "keywords": [...]
       }
     ]
   }
   ```

### Plugin Categories

- **lsp**: Language server integrations (e.g., rescript-lsp)
- **tool**: Build tools, formatters, linters (e.g., rescript-format, rescript-build)
- **skill**: Educational modules with thinking patterns (e.g., rescript-thinking)

## ReScript Requirements

Users must have installed:
- `rescript` (globally via npm/yarn/pnpm)
- `@rescript/language-server` (for LSP plugin)

### ReScript Language Server

**Installation:**
```bash
npm install -g @rescript/language-server
```

**Verification:**
```bash
rescript-language-server --version
```

**Command-Line Options:**
- `--stdio` - Communicate via standard input/output (used by this plugin)
- `--node-ipc` - Use Node's inter-process communication protocol
- `-v, --version` - Display version number
- `-h, --help` - Show usage information

**Source Code & Documentation:**
- [ReScript Language Server Source](https://github.com/rescript-lang/rescript-vscode/tree/master/server)
- Written in TypeScript
- Part of the rescript-vscode project
- Provides IDE support for code completion, diagnostics, and navigation

## File Extension Conventions

- `.res` - ReScript implementation files
- `.resi` - ReScript interface files

The LSP plugin is configured to handle both extensions and provide type information, go-to-definition, find references, and autocompletion.

## Current Plugin: rescript-lsp

Location: `plugins/rescript-lsp/.claude-plugin/plugin.json`

Provides:
- Language Server Protocol integration
- Real-time type checking
- Code navigation (go-to-definition, find references)
- Hover documentation
- Intelligent autocompletion

The plugin wraps the existing `rescript-language-server` executable and requires no additional build steps.

## Standard Plugin Components

According to [Claude Code plugin structure](https://github.com/anthropics/claude-code/blob/main/plugins/README.md), plugins can contain:

- **`.claude-plugin/plugin.json`** (required) - Plugin manifest with metadata
- **`commands/`** (optional) - Slash commands for user interaction
- **`agents/`** (optional) - Specialized AI agents for specific tasks
- **`skills/`** (optional) - Auto-invoked capabilities for specific contexts
- **`hooks/`** (optional) - Event handlers (SessionStart, PreToolUse, Stop)
- **`.mcp.json`** (optional) - Model Context Protocol configuration for external tools

This repository currently focuses on LSP integration. Future expansions could include commands, skills, or hooks following the [official plugin development patterns](https://code.claude.com/docs/en/plugins).