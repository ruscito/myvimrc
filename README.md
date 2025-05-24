# Neovim Configuration Keybinds

This configuration enhances Neovim with productivity-focused keybinds, plugins, and LSP support.  
**Leader Key:** `<Space>`
---
## General Keybinds

Essential Mappings
| Mapping | Mode | Action |
|---------|------|--------|
| <Space> | Normal | Leader key |
| jk | Insert | Exit insert mode (alternative to Esc) |
| <Esc><Esc> | Terminal | Exit terminal mode |
File Operations
| Mapping | Action |
|---------|--------|
| <leader>w | Quick save |
| <leader>q | Quick quit |
| <leader>ev | Edit .vimrc in vertical split |
| <leader>sv | Source/reload .vimrc |
Navigation
| Mapping | Action |
|---------|--------|
| <C-h/j/k/l> | Navigate between splits |
| <leader>bn | Next buffer |
| <leader>bp | Previous buffer |
| <leader>bd | Delete current buffer |
Window Management
| Mapping | Action |
|---------|--------|
| <leader>vs | Vertical split |
| <leader>hs | Horizontal split |
| <leader>c | Close current window |
| <Up/Down/Left/Right> | Resize splits |
File Explorer
| Mapping | Action |
|---------|--------|
| <leader>e | Open file explorer |
| <leader>l | Toggle left file explorer |
Search and Fuzzy Finding
| Mapping | Action |
|---------|--------|
| <leader>/ | Clear search highlighting |
| <leader>h | Clear search highlights |
| <leader>f | Find files (FZF) |
| <leader>b | Find buffers (FZF) |
| <leader>g | Search text with Ripgrep |
Git Operations
| Mapping | Action |
|---------|--------|
| <leader>gs | Git status |
| <leader>gc | Git commit |
| <leader>gp | Git push |
| <leader>gl | Git log |
Programming
| Mapping | Action |
|---------|--------|
| <leader>cc | Comment lines |
| <leader>cu | Uncomment lines |
| <leader>r | Run script (./run.sh) |
| <Tab> | Jump out of closing delimiter |
Utilities
| Mapping | Action |
|---------|--------|
| <leader>n | Toggle relative/absolute line numbers |
| <leader>st | Toggle terminal window |
| <C-q> | Return to original window from terminal |
