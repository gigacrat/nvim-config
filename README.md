# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim)
and NvChad's [base46](https://github.com/nvchad/base46) theming.

## Requirements

| | why |
|---|---|
| **Neovim >= 0.12.0** | `nvim-treesitter` tracks its `main` branch, which requires 0.12; the LSP keymaps build on the `gr*` defaults added in 0.11 |
| **Git** | plugin management |
| **A C compiler** | building treesitter parsers |
| **[tree-sitter-cli](https://github.com/tree-sitter/tree-sitter) >= 0.26.1** | required by `nvim-treesitter` `main`. Install via your package manager, **not npm** |
| **[ripgrep](https://github.com/BurntSushi/ripgrep)** | Telescope's `live_grep` (`<leader>fw`) shells out to `rg` |
| **[Nerd Font](https://www.nerdfonts.com/)** | icons |
| **Node.js** | Copilot |

Language servers are installed automatically by Mason: `lua_ls`, `pyright`,
`ts_ls`, `bashls`, `jsonls`, `yamlls`.

## Installation

```bash
git clone https://github.com/gigacrat/nvim-config ~/.config/nvim
```

Plugins and treesitter parsers install on first launch.

## Layout

```
init.lua
lua/
  options.lua       vim options, leader key
  keybindings.lua   general keymaps
  chadrc.lua        base46 theme config, terminal toggles
  lazy-setup.lua    plugin manager bootstrap
  themes/           custom base46 themes
  plugins/          one file per plugin
```

`lua/themes/` holds hand-written base46 themes. base46 resolves user themes
by `require("themes.<name>")` off the runtimepath, and NvChad's theme picker
scans this exact directory, so themes here are both loadable and selectable.
Every `.lua` file in it is treated as a theme, so helper modules must live
elsewhere.

## Keybindings

Leader is `<Space>`. `which-key` shows these on demand.

### Groups

| prefix | group |
|---|---|
| `<leader>a` | AI (Copilot Chat) |
| `<leader>b` | Buffer |
| `<leader>f` | Find (Telescope) |
| `<leader>g` | Git |
| `<leader>l` | LSP |
| `<leader>s` | Search/Replace |
| `<leader>t` | Toggle |
| `<leader>w` | Window |

### Files and search

| key | action |
|---|---|
| `<leader>e` / `<leader>E` | file explorer, float / at root |
| `<leader>ff` `fw` `fs` | find files / grep / word under cursor |
| `<leader>fb` `fr` `fh` `fk` `fc` `fd` | buffers, recent, help, keymaps, commands, diagnostics |
| `<leader>ft` | theme picker |
| `<leader>ss` `sw` `sr` | replace in buffer / word under cursor / resume search |

### LSP

Navigation overrides only where the LSP feature is a strict upgrade of the
vanilla key; everything else uses Neovim's built-in `gr*` namespace
(`:help lsp-defaults`).

| key | action | source |
|---|---|---|
| `gd` `gD` `K` | definition, declaration, hover | config (Telescope for `gd`) |
| `grr` `gri` `grt` | references, implementation, type definition | built-in keys, Telescope pickers |
| `gra` `grn` `grx` `gO` | code action, rename, codelens, symbols | Neovim defaults |
| `<leader>la` `lr` `lf` `ld` `ls` `lS` `li` `lR` | action, rename, format, diagnostics, symbols, info, restart | config |
| `]d` / `[d` | next / previous diagnostic | Neovim default |

### Git

| key | action |
|---|---|
| `]g` / `[g` | next / previous hunk |
| `<leader>gs` `gr` `gS` `gR` | stage / reset hunk, stage / reset buffer |
| `<leader>gp` `gb` `gd` `gD` | preview hunk, blame line, diff, diff against `~` |
| `<leader>gg` `gG` | commit, amend (fugitive) |
| `<leader>gtb` `gtd` | toggle line blame, toggle deleted |

### Windows, buffers, terminals

| key | action |
|---|---|
| `<C-h/j/k/l>` | move between windows (also from terminal mode) |
| `<C-n>` / `<C-p>` | next / previous buffer |
| `<leader>w…` | split, close, balance, navigate |
| `<leader>b…` | next, previous, delete buffer |
| `<A-v>` `<A-h>` `<A-f>` | vertical / horizontal / floating terminal |
| `<Esc>` | clear search highlights (normal) / exit terminal mode |

### Editing

| key | action |
|---|---|
| `<A-j>` / `<A-k>` | move line or selection down / up |
| `<` / `>` (visual) | indent, keeping the selection |
| `p` (visual) | paste over selection without clobbering the register |

## License

MIT
