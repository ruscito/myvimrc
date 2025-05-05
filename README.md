# Neovim Configuration Keybinds

This configuration enhances Neovim with productivity-focused keybinds, plugins, and LSP support.  
**Leader Key:** `<Space>`

---

## General Keybinds

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `jk` (Insert)    | Exit insert mode                        |
| `<Leader>w`      | Save file                               |
| `<Leader><Leader>` | Reload current file (`:source %`)      |
| `<Leader>c`      | Clear search highlights                 |
| `<Leader>td`     | Toggle diagnostics (LSP)                |
| `<Leader>n`      | Toggle line numbers                     |

---

## File & Buffer Management

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>e`      | Open file explorer (`:Ex`)              |
| `<Leader>bn`     | Next buffer                             |
| `<Leader>bp`     | Previous buffer                         |
| `<Leader>bd`     | Delete current buffer                   |

---

## Window & Split Management

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>sv`     | Split window vertically                 |
| `<Leader>sh`     | Split window horizontally               |
| `<Leader>se`     | Equalize split sizes                    |
| `<Leader>sx`     | Close current split                     |

---

## Tab Management

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>to`     | Open new tab                            |
| `<Leader>tx`     | Close current tab                       |
| `<Leader>tn`     | Next tab                                |
| `<Leader>tp`     | Previous tab                            |
| `<Leader>tf`     | Open current buffer in new tab          |

---

## Terminal

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>st`     | Toggle terminal (bottom split)          |
| `Ctrl+q` (Term)  | Exit terminal and return to last window |

---

## Telescope (Fuzzy Finder)

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>ff`     | Find files                              |
| `<Leader>fg`     | Live grep (search text)                 |
| `<Leader>fb`     | Search buffers                          |
| `<Leader>fh`     | Search help tags                        |

---

## LSP (Language Server Protocol)

| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `gd`            | Go to definition (uncommented)          |
| `K`             | Hover documentation (uncommented)       |
| `<Leader>rn`    | Rename symbol (uncommented)             |
| `<Leader>ca`    | Code actions (uncommented)              |
| `gr`            | Show references (uncommented)           |
| `<Leader>cf`    | Format file (uncommented)               |
| `<Leader>cd`    | Show diagnostics (uncommented)          |

---

## Plugins Used
- **Colorschemes:** `onedark.nvim`, `melange-nvim`  
- **Status Line:** `lualine.nvim`  
- **Syntax:** `nvim-treesitter`  
- **LSP:** `mason.nvim`, `nvim-lspconfig`  
- **Completions:** `nvim-cmp`, `LuaSnip`  
- **Fuzzy Finder:** `telescope.nvim`  
- **Git:** `gitsigns.nvim`  
- **Builds:** `asyncrun.vim`  

---

### Auto-Formatting
Files (`*.c`, `*.h`, `*.lua`) are automatically formatted on save using LSP.

### AsyncRun Keybind
| Keybind          | Action                                  |
|------------------|-----------------------------------------|
| `<Leader>x`      | Run `./run.sh` (via AsyncRun)           |
