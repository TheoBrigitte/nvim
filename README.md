# NeoVim Configuration

A professionally crafted NeoVim setup leveraging [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin management. This configuration provides a complete development environment with LSP integration, intelligent autocompletion, advanced search capabilities, and AI-assisted coding features.

## Core Features

- **Plugin Management**: Efficient lazy-loading with [lazy.nvim](https://github.com/folke/lazy.nvim) and automatic dependency updates
- **Language Server Protocol**: Comprehensive LSP support powered by Mason for streamlined language server installation and management
- **Intelligent Completion**: Advanced completion engine via [blink.cmp](https://github.com/saghen/blink.cmp) with GitHub Copilot integration
- **Fuzzy Finding**: High-performance file and buffer navigation using [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- **AI-Powered Assistance**: Integrated [claude-code.nvim](https://github.com/TheoBrigitte/claude-code.nvim) for AI-assisted development workflows
- **Advanced Navigation**: Rapid cursor movement with Flash.nvim and seamless tmux pane integration
- **Version Control**: Built-in Git integration via Gitsigns featuring inline diff indicators and merge conflict resolution utilities
- **File Management**: Intuitive file tree navigation with Neo-tree
- **Modern UI**: Enhanced user interface through Noice.nvim for notifications and command-line display, complemented by Lualine for an informative statusline
- **Syntax Analysis**: Precise syntax highlighting and code understanding powered by Tree-sitter
- **Theme System**: Base16 Tomorrow Night color scheme with dynamic light/dark mode switching

## System Requirements

### Core Dependencies

- **NeoVim**: Version 0.10.0 or higher
- **Git**: Required for plugin management and version control features
- **Node.js**: Required for Language Server Protocol functionality - nodejs-neovim
- **Tree-sitter**: Required for object motion  - tree-sitter-cli

### Recommended Dependencies

- **lua51** / **luarocks**: Essential for Lua language development and tooling
- **php** / **composer**: Required for PHP development workflows
- **ripgrep**: Significantly accelerates grep operations within fzf-lua
- **fd**: Enhances file discovery performance with fzf-lua
- **Nerd Font**: Necessary for proper icon rendering (JetBrainsMono Nerd Font recommended)

### AI Integration Requirements

- **cursor-agent**: CLI tool required for Claude Code integration

## Installation Guide

### 1. Preserve Existing Configuration

If you have an existing NeoVim configuration, create a backup:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

### 2. Deploy Configuration

Clone this repository to your NeoVim configuration directory:

```bash
git clone <your-repo-url> ~/.config/nvim
```

### 3. Initialize Environment

Launch NeoVim to trigger automatic plugin installation:

```bash
nvim
```

The lazy.nvim plugin manager will automatically download and configure all dependencies on the initial launch.

### 4. Configure Language Servers (Optional)

After the initial setup, install language servers for your preferred programming languages:

1. Open NeoVim and execute: `:Mason`
2. Navigate the Mason interface and press `i` to install language servers

## Configuration Structure

```
~/.config/nvim
├── after
│   └── settings.vim
├── cursor-agent.patch
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── lazy.lua
│   │   ├── mapping.lua
│   │   └── options.lua
│   └── plugins
│       ├── base16.lua
│       ├── blink.lua
│       ├── claude-code.lua
│       ├── copilot.none
│       ├── flash.lua
│       ├── fzf.lua
│       ├── gitsign.lua
│       ├── init.old
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── neotree.lua
│       ├── noice.lua
│       ├── nvim-treesitter.lua
│       ├── persistence.no
│       ├── shellcheck.lua
│       ├── tmux.lua
│       ├── vim-fetch.lua
│       └── which-keys.lua
└── README.md
```

## Keyboard Shortcuts

### General Operations

| Key | Mode | Action |
|-----|------|--------|
| `<leader>w` | Normal | Save file |
| `<leader>Q` | Normal | Quit all (force) |
| `<leader>z` | Normal | Suspend NeoVim |
| `<leader>C` | Normal | Toggle light/dark color scheme |
| `Y` | Normal | Yank to system clipboard |
| `<leader>p` | Normal | Paste from system clipboard (after) |
| `<leader>P` | Normal | Paste from system clipboard (before) |

**Leader Key**: `\` (backslash)

### File and Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | Normal | Find files (fzf) |
| `<leader>b` | Normal | Browse buffers (fzf) |
| `<leader>gr` | Normal | Grep in files (fzf) |
| `<leader>n` | Normal | Toggle file explorer (Neo-tree) |
| `<leader>m` | Normal | Reveal current file in Neo-tree |

### Rapid Motion

| Key | Mode | Action |
|-----|------|--------|
| `s` | Normal/Visual/Operator | Flash jump |
| `S` | Normal/Visual/Operator | Flash Treesitter jump |
| `r` | Operator | Remote Flash |
| `R` | Operator/Visual | Treesitter Search |

### Window and Pane Management

| Key | Action |
|-----|--------|
| `<C-h>` | Navigate to left window (or tmux pane) |
| `<C-j>` | Navigate to down window (or tmux pane) |
| `<C-k>` | Navigate to up window (or tmux pane) |
| `<C-l>` | Navigate to right window (or tmux pane) |
| `<C-Up>` | Increase height |
| `<C-Down>` | Decrease height |
| `<C-Left>` | Decrease width |
| `<C-Right>` | Increase width |

### Git

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gf` | Normal | Find next git conflict marker |
| `<leader>go` | Normal | Accept "ours" in conflict |
| `<leader>gt` | Normal | Accept "theirs" in conflict |

### Claude Code (AI Assistant)

| Key | Mode | Action |
|-----|------|--------|
| `<C-a>` | Normal/Terminal | Toggle Claude Code |
| `<leader>cC` | Normal | Open Claude Code (continue mode) |
| `<leader>cV` | Normal | Open Claude Code (verbose mode) |
| `` `<Arrow>`` | Terminal | Navigate windows in Claude Code |
| `<C-f>/<C-b>` | Terminal | Page down/up in Claude Code |

### Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `<Tab>` | Accept completion / next item |
| `<S-Tab>` | Previous item |
| `<C-Space>` | Open menu / show docs |
| `<C-e>` | Close menu |
| `<C-n>/<C-p>` | Next/Previous item |
| `<C-k>` | Toggle signature help |

### LSP

| Key | Action |
|-----|--------|
|  ]d | Jump to next diagnostic |
|  [d | Jump to previous diagnostic |
|  <C-w>d | Open diagnostics in a floating window |

### Shell Check

| Key | Mode | Action |
|-----|------|--------|
| `<leader>s` | Normal | Run ShellCheck on current file |

### Help

| Key | Mode | Action |
|-----|------|--------|
| `<leader>?` | Normal | Show buffer local keymaps |

## Customization

### Adding New Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/my-plugin.lua
return {
    {
        "author/plugin-name",
        opts = {
            -- configuration here
        }
    }
}
```

Lazy.nvim will automatically load it.

### Changing Color Scheme

Edit `lua/plugins/base16.lua`:

```lua
vim.cmd.colorscheme("your-preferred-colorscheme")
```

### Configuring LSP Servers

LSP servers can be installed through Mason (`:Mason`) or configured directly in `lua/config/lazy.lua`. The configuration includes gopls setup as an example.

### Modifying Keybindings

Most plugin-specific keybindings are defined in their respective plugin files in `lua/plugins/`. Global keybindings are in `lua/config/lazy.lua`.

## Troubleshooting

### Plugins not loading

Run `:Lazy sync` to update and reload plugins.

### LSP not working

1. Check if language server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Ensure the language server is enabled in your configuration

### Completion not showing

1. Ensure blink.cmp is loaded: `:Lazy`
2. Check if Copilot is properly configured (if using)
3. Try `<C-Space>` to manually trigger completion

### Claude Code not working

Ensure the `cursor-agent` command is available in your PATH.

## Additional Resources

- [NeoVim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Documentation](https://lazy.folke.io/)
- [Mason.nvim Documentation](https://github.com/mason-org/mason.nvim)
- [Blink.cmp Documentation](https://github.com/saghen/blink.cmp)
- [TreeSitter tutorial](https://www.josean.com/posts/nvim-treesitter-and-textobjects)

## Notes

- **Persistent Undo**: Undo history is saved in `~/.local/state/nvim/undo/`
- **Auto-update**: Plugin updates are automatically checked (without notifications)
- **Search Highlighting**: Only highlights during active search, auto-clears after
- **Typo Protection**: Common command typos like `:W`, `:Q` are auto-corrected

## Contributing

Feel free to customize this configuration to your needs. If you encounter issues or have suggestions for improvements, please create an issue or pull request.
