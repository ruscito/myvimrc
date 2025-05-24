# Vim Key Mappings Reference

## Leader Key
The leader key is set to **Space** (`<Space>`).

## Essential Mappings

| Mapping | Mode | Action |
|---------|------|--------|
| `<Space>` | Normal | Leader key |
| `jk` | Insert | Exit insert mode (alternative to Esc) |
| `<Esc><Esc>` | Terminal | Exit terminal mode |

## File Operations
| Mapping | Action |
|---------|--------|
| `<leader>w` | Quick save |
| `<leader>q` | Quick quit |
| `<leader>ev` | Edit .vimrc in vertical split |
| `<leader>sv` | Source/reload .vimrc |

## Navigation
| Mapping | Action |
|---------|--------|
| `<C-h>` | Move to left split |
| `<C-j>` | Move to split below |
| `<C-k>` | Move to split above |
| `<C-l>` | Move to right split |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete current buffer |

## Window Management
| Mapping | Action |
|---------|--------|
| `<leader>vs` | Vertical split |
| `<leader>hs` | Horizontal split |
| `<leader>c` | Close current window |
| `<Up>` | Increase window height |
| `<Down>` | Decrease window height |
| `<Left>` | Decrease window width |
| `<Right>` | Increase window width |

## File Explorer
| Mapping | Action |
|---------|--------|
| `<leader>e` | Open file explorer |
| `<leader>l` | Toggle left file explorer |

## Search and Fuzzy Finding
| Mapping | Action |
|---------|--------|
| `<leader>/` | Clear search highlighting |
| `<leader>h` | Clear search highlights |
| `<leader>f` | Find files (FZF) |
| `<leader>b` | Find buffers (FZF) |
| `<leader>g` | Search text with Ripgrep |

## Git Operations
| Mapping | Action |
|---------|--------|
| `<leader>gs` | Git status |
| `<leader>gc` | Git commit |
| `<leader>gp` | Git push |
| `<leader>gl` | Git log |

## Programming
| Mapping | Mode | Action |
|---------|------|--------|
| `<leader>cc` | Normal/Visual | Comment lines |
| `<leader>cu` | Normal/Visual | Uncomment lines |
| `<leader>r` | Normal | Run script (./run.sh) |
| `<Tab>` | Insert | Jump out of closing delimiter |

## Auto-Closing (Insert Mode)
| Mapping | Result |
|---------|--------|
| `{` | `{}`(cursor between) |
| `{<CR>` | `{<CR>}<Esc>O` (formatted block) |
| `(` | `()`(cursor between) |
| `[` | `[]`(cursor between) |
| `"` | `""`(cursor between) |
| `'` | `''`(cursor between) |

## Utilities
| Mapping | Action |
|---------|--------|
| `<leader>n` | Toggle relative/absolute line numbers |
| `<leader>st` | Toggle terminal window |
| `<C-q>` | Return to original window from terminal (Terminal mode) |

## Disabled Mappings
| Mapping | Mode | Status |
|---------|------|--------|
| Arrow keys | Visual | Disabled (forces hjkl usage) |
