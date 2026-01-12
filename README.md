# Claude Code ReScript

A Claude Code plugin marketplace for ReScript development, providing language tooling and intelligent code assistance for the Claude Code CLI.

## Overview

This plugin integrates ReScript language support into Claude Code, enabling intelligent code navigation, type information, and autocompletion through the ReScript Language Server Protocol (LSP).

## Features

### Tools

- **rescript-lsp**: Language Server integration providing:
  - Go to definition
  - Find references
  - Hover documentation
  - Type information
  - Intelligent autocompletion
  - Code diagnostics

## Installation

### Quick Install (Marketplace)

```bash
claude plugin marketplace add dsiu/claude-code-rescript
```

### Individual Plugin Install

```bash
claude plugin install rescript-lsp@claude-code-rescript
```

### Manual Installation

1. Clone this repository
2. Install the plugin locally:
```bash
claude plugin install ./plugins/rescript-lsp
```

## Requirements

- **ReScript**: Install via npm/yarn/pnpm
  ```bash
  npm install -g rescript
  ```

- **ReScript Language Server**: Typically installed with ReScript
  ```bash
  npm install -g @rescript/language-server
  ```

- Verify installation:
  ```bash
  rescript-language-server --version
  ```

## Project Structure

```
claude-code-rescript/
├── .claude-plugin/          # Plugin marketplace configuration
│   └── marketplace.json     # Marketplace metadata
├── plugins/
│   └── rescript-lsp/        # ReScript LSP plugin
│       └── .claude-plugin/
│           └── plugin.json  # Plugin configuration
└── README.md
```

## Plugin Configuration

### ReScript LSP

The LSP plugin is configured to handle ReScript source files:

- `.res` - ReScript implementation files
- `.resi` - ReScript interface files

The plugin automatically starts the ReScript language server when you work with ReScript files, providing real-time type checking and intelligent code assistance.

## Usage

Once installed, the plugin automatically activates when you open ReScript files (`.res`, `.resi`). Claude Code will leverage the language server to provide:

- Accurate type information for better code generation
- Context-aware suggestions based on your project structure
- Navigate to definitions and find references across your codebase

## Contributing

Contributions are welcome! To add new plugins or improve existing ones:

1. Fork the repository
2. Create a new plugin directory under the `plugins/` directory
3. Add plugin configuration in `.claude-plugin/plugin.json`
4. Update `marketplace.json` to include your plugin
5. Submit a pull request

## Roadmap

Future plugins under consideration:

- **rescript-format**: Auto-format `.res`/`.resi` files on save
- **rescript-build**: Run ReScript compiler with watch mode integration
- **rescript-thinking**: Educational skill for functional programming patterns in ReScript
- **rescript-react-thinking**: Best practices for ReScript React development

## License

MIT License - See LICENSE file for details

## Author

Danny Siu

## Links

- [ReScript Official Site](https://rescript-lang.org/)
- [ReScript Language Server](https://github.com/rescript-lang/rescript-vscode)
- [Claude Code Documentation](https://docs.anthropic.com/claude-code)

## Support

For issues or questions:
- Open an issue on [GitHub](https://github.com/dsiu/claude-code-rescript/issues)
- Check the [Claude Code documentation](https://docs.anthropic.com/claude-code)
- Visit the [ReScript forum](https://forum.rescript-lang.org/)