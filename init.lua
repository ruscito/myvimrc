-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.termguicolors = true
--vim.opt.timeoutlen = 300 -- Time to wait after leader key
vim.opt.clipboard:append("unnamedplus") -- System clipboard integration

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
    -- Colorscheme
    { "navarasu/onedark.nvim" },
    { "savq/melange-nvim" },

    -- Status line
    { "nvim-lualine/lualine.nvim" },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "cpp", "vim", "query" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- LSP, DAP, Linter, Formatter manager
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap"
        }
    },

    -- Completion framework
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        }
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Git integration
    { "lewis6991/gitsigns.nvim" },

    -- AsyncRun
    {
        "skywind3000/asyncrun.vim",
        -- Optional: Lazy-load on commands or keymaps
        lazy = true,
        cmd = { "AsyncRun", "AsyncStop" }, -- Load when these commands are used
        keys = {                           -- Optional: Set up keybindings to trigger AsyncRun
            { "<Leader>x", ":AsyncRun ./run.sh<CR>", mode = "n", desc = "AsyncRun start.sh" },
        },
    },

})

-- Set colorscheme
-- vim.cmd.colorscheme("onedark")
vim.cmd.colorscheme("melange")
--[[
-- Base editor colors
vim.cmd("hi Normal       ctermfg=252 ctermbg=237 guifg=#d0d0d0 guibg=#3a3a3a")
vim.cmd("hi LineNr       ctermfg=243 ctermbg=237 guifg=#767676 guibg=#3a3a3a")
vim.cmd("hi CursorLineNr ctermfg=214 ctermbg=238 guifg=#ffaf00 guibg=#444444 cterm=bold gui=bold")
vim.cmd("hi NonText      ctermfg=240 ctermbg=237 guifg=#585858 guibg=#3a3a3a")
vim.cmd("hi SpecialKey   ctermfg=240 ctermbg=237 guifg=#585858 guibg=#3a3a3a")

-- Status line and splits
vim.cmd("hi StatusLine   ctermfg=252 ctermbg=236 guifg=#d0d0d0 guibg=#303030")
vim.cmd("hi StatusLineNC ctermfg=246 ctermbg=236 guifg=#949494 guibg=#303030")
vim.cmd("hi VertSplit    ctermfg=236 ctermbg=236 guifg=#303030 guibg=#303030")

-- Tab line
vim.cmd("hi TabLine      ctermfg=246 ctermbg=236 guifg=#949494 guibg=#303030")
vim.cmd("hi TabLineFill  ctermfg=246 ctermbg=236 guifg=#949494 guibg=#303030")
vim.cmd("hi TabLineSel   ctermfg=252 ctermbg=238 guifg=#d0d0d0 guibg=#444444")

-- Popup menu
vim.cmd("hi Pmenu        ctermfg=252 ctermbg=236 guifg=#d0d0d0 guibg=#303030")
vim.cmd("hi PmenuSel     ctermfg=0   ctermbg=214 guifg=#000000 guibg=#ffaf00")
vim.cmd("hi PmenuSbar    ctermbg=236 guibg=#303030")
vim.cmd("hi PmenuThumb   ctermbg=240 guibg=#585858")

-- Cursor and current line highlight
vim.cmd("hi Cursor       guifg=#000000 guibg=#ffaf00")
vim.cmd("hi CursorLine   ctermbg=238 guibg=#444444 cterm=none gui=none")
vim.cmd("hi CursorColumn ctermbg=238 guibg=#444444")
vim.cmd("hi ColorColumn  ctermbg=238 guibg=#444444")

-- Fold columns
vim.cmd("hi Folded       ctermfg=246 ctermbg=238 guifg=#949494 guibg=#444444")
vim.cmd("hi FoldColumn   ctermfg=246 ctermbg=237 guifg=#949494 guibg=#3a3a3a")

-- Diff mode
vim.cmd("hi DiffAdd      ctermfg=0   ctermbg=114 guifg=#000000 guibg=#87d787")
vim.cmd("hi DiffChange   ctermfg=0   ctermbg=186 guifg=#000000 guibg=#d7d787")
vim.cmd("hi DiffDelete   ctermfg=0   ctermbg=174 guifg=#000000 guibg=#d78787")
vim.cmd("hi DiffText     ctermfg=0   ctermbg=214 guifg=#000000 guibg=#ffaf00")

-- Selection and search
vim.cmd("hi Visual       ctermfg=235 ctermbg=186 guifg=#262626 guibg=#d7d787")
vim.cmd("hi Search       ctermfg=0   ctermbg=214 guifg=#000000 guibg=#ffaf00")
vim.cmd("hi MatchParen   ctermfg=0   ctermbg=214 guifg=#000000 guibg=#ffaf00")
vim.cmd("hi Todo         ctermfg=0   ctermbg=184 guifg=#000000 guibg=#d7d700")

-- Syntax highlighting
vim.cmd("hi Comment      ctermfg=246 guifg=#949494")
vim.cmd("hi Statement    ctermfg=214 guifg=#ffaf00")
vim.cmd("hi Type         ctermfg=214 guifg=#ffaf00")
vim.cmd("hi cOperator    ctermfg=214 guifg=#ffaf00")
vim.cmd("hi Identifier   ctermfg=146 guifg=#afafd7")
vim.cmd("hi PreProc      ctermfg=81  guifg=#5fd7ff")
vim.cmd("hi Constant     ctermfg=174 guifg=#d78787")
vim.cmd("hi Special      ctermfg=174 guifg=#d78787")
vim.cmd("hi String       ctermfg=186 guifg=#d7d787")
vim.cmd("hi cStructure   ctermfg=186 guifg=#d7d787")
vim.cmd("hi cFunction    ctermfg=114 guifg=#87d787")
vim.cmd("hi cCustomFunc  ctermfg=114 guifg=#87d787")-- Highlight groups for the status line
vim.api.nvim_set_hl(0, "StatusLine", {
  ctermfg = 234, ctermbg = 214,
  fg = "#1c1c1c", bg = "#ffaf00"
})

vim.api.nvim_set_hl(0, "StatusLineNC", {
  ctermfg = 234, ctermbg = 180,
  fg = "#1c1c1c", bg = "#d7af87"
})

-- Custom status line
vim.opt.statusline = table.concat({
  "%#StatusLine#",  -- Use StatusLine highlight group
  " %f",            -- File name
  "%m",             -- Modified flag
  "%r",             -- Read-only flag
  "%h",             -- Help buffer flag
  "%w",             -- Preview window flag
  "%=",             -- Right-align the rest
  "%y ",            -- File type
  "%{&fileencoding !=# '' ? &fileencoding : &encoding} ",  -- Encoding
  "%{&fileformat} ",  -- File format
  "%l:%c ",         -- Line and column
  "%p%%"            -- Percentage through file
})


--]]

-- Basic key mappings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope help_tags<CR>", { silent = true })

-- Clear search highlight
vim.keymap.set("n", "<leader>c", ":nohl<CR>", { desc = "Clear serch highlights" })

-- file system
--keymap("n", "<leader>f", ":Ex<CR>", opts)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader><leader>", "<cmd>source %<CR>")

-- Enable disable diagnostic
vim.keymap.set("n", "<leader>td", function()
    local current = vim.diagnostic.is_enabled()
    vim.diagnostic.enable(not current)
    print("Diagnostics " .. (current and "disabled" or "enabled"))
end, { desc = "Toggle diagnostics" })

-- Toggle numbers
vim.keymap.set('n', '<leader>n', function()
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle line numbers" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- Exit terminal mode
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>")

-- window managment
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab managment
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current baffer in new tab" })

-- Window move
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

-- terminal
local term_win = nil
local original_win = nil

vim.keymap.set("n", "<leader>st", function()
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        -- Close terminal if open
        vim.api.nvim_win_close(term_win, true)
        term_win = nil
    else
        -- Open terminal
        original_win = vim.api.nvim_get_current_win()
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 10)
        term_win = vim.api.nvim_get_current_win()

        -- Enter insert mode automatically
        vim.schedule(function()
            vim.api.nvim_feedkeys("i", "n", false)
        end)
    end
end)

-- Exit terminal and return to top window with `<Esc>`
vim.keymap.set("t", "<C-q>", function()
    if original_win and vim.api.nvim_win_is_valid(original_win) then
        vim.api.nvim_set_current_win(original_win)
    end
end, { noremap = true, silent = true })

-- Toggle editor/.terminal
vim.keymap.set("n", "<leader>tt", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd.wincmd("p")  -- Go to previous window
    else
        if term_win and vim.api.nvim_win_is_valid(term_win) then
            vim.api.nvim_set_current_win(term_win)
        else
            vim.notify("No terminal window found")
        end
    end
end, { desc = "Toggle between terminal and editor" })

local job_id = 0
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    job_id = vim.bo.channel
    -- Enter terminal insert mode automatically (like pressing "i")
    vim.schedule(function()
        vim.api.nvim_feedkeys("i", "n", false)
    end)
end)

vim.keymap.set("n", "<leader>5", function()
    -- make
    vim.fn.chansend(job_id, { "ls -al\r\n" })
end)

-- Mason setup
require("mason").setup({
    ui = {
        icon = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- LSP configuration
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- LSP key mappings
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, bufopts)
    -- vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, bufopts)
end

-- Language servers
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd" }
})

-- Lua LSP
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false }
        }
    }
})

-- C LSP (clangd)
lspconfig.clangd.setup({
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never"
    }
})


-- Completion setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Telescope setup
require('telescope').setup()

-- Auto-format on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.c', '*.h', '*.lua' },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})


-- Lualine setup
require('lualine').setup({
    options = {
        -- theme = 'onedark'
        theme = 'melange'
    }
})

-- Gitsigns setup
require('gitsigns').setup()
