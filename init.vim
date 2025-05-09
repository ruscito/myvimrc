" Tsoding-inspired .vimrc configuration
" Based on Alexey Kutepov's (Tsoding) preferences

" ========== Basic Setup ==========
set nocompatible              " Use Vim settings, rather than Vi settings
syntax on                     " Enable syntax highlighting
set encoding=utf-8            " Use UTF-8 encoding
set fileencoding=utf-8        " Use UTF-8 for files
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set ruler                     " Show cursor position
set showcmd                   " Show incomplete commands
set showmode                  " Show current mode
set backspace=indent,eol,start " Make backspace behave normally
set hidden                    " Allow hiding buffers with unsaved changes
set laststatus=2              " Always show status line
set confirm                   " Confirm before closing unsaved files
set visualbell                " No beeping
set t_vb=                     " No visual bell
set autoread                  " Auto reload files changed outside vim
set wildmenu                  " Visual autocomplete for command menu
set wildmode=list:longest     " Complete first match, then list
set title                     " Show filename in window title
set scrolloff=5               " Keep 5 lines above/below cursor

" ========== Indentation ==========
set autoindent                " Copy indent from current line when starting a new line
set smartindent               " Smart auto-indenting
set tabstop=4                 " Number of visual spaces per tab
set softtabstop=4             " Number of spaces in tab when editing
set shiftwidth=4              " Number of spaces used for each step of (auto)indent
set expandtab                 " Tabs are spaces
set shiftround                " Round indent to multiple of 'shiftwidth'

" ========== Searching ==========
set incsearch                 " Search as characters are entered
set hlsearch                  " Highlight matches
set ignorecase                " Ignore case when searching
set smartcase                 " Override 'ignorecase' if search pattern has uppercase

" ========== Performance ==========
set lazyredraw                " Don't redraw while executing macros
set ttyfast                   " Faster redrawing
set updatetime=300            " Faster updates for git gutter etc

" ========== File Management ==========
set nobackup                  " Don't keep backup files
set nowritebackup             " Don't make a backup before overwriting a file
set noswapfile                " Don't use swap files
set undofile                  " Maintain undo history between sessions
set undodir=~/.vim/undodir    " Directory for undo files
if !isdirectory(&undodir)
    call mkdir(&undodir, "p", 0700)
endif

" ========== Visual Settings ==========
set background=dark           " Use dark background
set cursorline                " Highlight current line
set showmatch                 " Highlight matching [{()}]
set nowrap                    " Don't wrap lines
set colorcolumn=80            " Show column at 80 characters
set list                      " Show invisible characters
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Display tab characters and trailing spaces

" Custom C/C++ syntax highlighting with orange keywords and mild white functions
augroup CustomCHighlighting
    autocmd!
    " Highlight C keywords in orange
    autocmd FileType c,cpp highlight cStatement ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cLabel ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cConditional ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cRepeat ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cType ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cStorageClass ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cStructure ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cOperator ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cPreCondit ctermfg=214 guifg=orange
    autocmd FileType c,cpp highlight cConstant ctermfg=214 guifg=orange
    
    " Highlight functions in mild white
    autocmd FileType c,cpp highlight cFunction ctermfg=252 guifg=#d0d0d0
    autocmd FileType c,cpp highlight Function ctermfg=252 guifg=#d0d0d0
    
    " Make sure the highlighting persists
    autocmd ColorScheme * highlight cStatement ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cLabel ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cConditional ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cRepeat ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cType ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cStorageClass ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cStructure ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cOperator ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cPreCondit ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cConstant ctermfg=214 guifg=orange
    autocmd ColorScheme * highlight cFunction ctermfg=252 guifg=#d0d0d0
    autocmd ColorScheme * highlight Function ctermfg=252 guifg=#d0d0d0
augroup END

" ========== Key Mappings ==========
let mapleader = " "           " Space as leader key

" Quick editing of .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap jk to escape in insert mode
inoremap jk <Esc>

" Disable arrow keys to enforce hjkl navigation
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Clear search highlighting with <leader>/
nnoremap <leader>/ :nohlsearch<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Split management
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :split<CR>

" Quick save
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" ========== Programming Specific ==========
" Auto close braces, brackets, etc.
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Left>
inoremap [ []<Left>

" Comment/uncomment lines
autocmd FileType c,cpp,java,scala,go let b:comment_leader = '// '
autocmd FileType sh,ruby,python,yaml let b:comment_leader = '# '
autocmd FileType vim let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" ========== File Types ==========
" Set file type based on extension
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Language-specific settings
autocmd FileType python setlocal textwidth=79 tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript,typescript,html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ========== Plugin settings ==========
" If using plugins, uncomment and modify these sections

" Vim-plug installation (uncomment if using vim-plug)
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Plugin section (uncomment and add your plugins)
" call plug#begin('~/.vim/plugged')
" 
" " Navigation and search
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" 
" " Git integration
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" 
" " Additional functionality
" Plug 'tpope/vim-commentary'  " Commenting
" Plug 'tpope/vim-surround'    " Surround text
" 
" " Language support
" Plug 'sheerun/vim-polyglot'  " Language pack
" 
" " Colorscheme
" Plug 'morhetz/gruvbox'       " Tsoding often uses gruvbox
" 
" call plug#end()
" 
" " Plugin configurations
" colorscheme gruvbox
" 
" " FZF configurations
" nnoremap <C-p> :Files<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" 
" " Git configurations
" nnoremap <leader>gs :Git<CR>
" nnoremap <leader>gc :Git commit<CR>
" nnoremap <leader>gp :Git push<CR>
" nnoremap <leader>gl :Git log<CR>
"
" " End of plugin settings

" ========== Custom Functions ==========
" Toggle between relative and absolute line numbers
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <leader>n :call ToggleNumber()<CR>

" Strip trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" ========== Status Line ==========
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineMode()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
  return "NORMAL"
endfunction
