
" ============================================================================
" BASIC SETTINGS
" ============================================================================
" Enable syntax highlighting and filetype detection
syntax on
filetype plugin indent on

" Set Space as the leader key (easier to reach than default backslash)
let mapleader = "\<Space>"

" ============================================================================
" MOUSE & CLIPBOARD
" ============================================================================
" Enable mouse support for scrolling and interaction
if !has('nvim')
  set ttymouse=sgr
endif
set mouse=a

" Integrate with system clipboard (yank/paste uses system clipboard)
set clipboard=unnamedplus

" Disable Ctrl+A increment (conflicts with tmux prefix key)
map <C-a> <Nop>

" ============================================================================
" WINDOW & SPLIT BEHAVIOR
" ============================================================================
" Open new splits to the right and bottom (more natural)
set splitright
set splitbelow

" ============================================================================
" SEARCH SETTINGS
" ============================================================================
" Keep search results highlighted after pressing enter
" Use :noh or Ctrl+L to clear highlighting
set hlsearch

" Case-insensitive search, unless uppercase letters are present
set ignorecase
set smartcase

" ============================================================================
" DISPLAY & INTERFACE
" ============================================================================
" Show tabs as >· and trailing spaces (helps spot whitespace issues)
set list
set listchars=tab:>·
" Alternative: show both tabs and trailing spaces
" set listchars=tab:>·,trail:·

" Keep 3 lines visible above/below cursor when scrolling
set scrolloff=3

" Display command-line autocomplete as a menu
set wildmenu

" Set timeout for key sequences (faster response)
set ttimeoutlen=50

" ============================================================================
" EDITING BEHAVIOR
" ============================================================================
" Fix backspace to work over indentation, line breaks, and insert start
set backspace=indent,eol,start

" Toggle paste mode with F3 (disables auto-indent when pasting)
" Note: Neovim handles paste automatically via bracketed paste mode
if !has('nvim')
  set pastetoggle=<F3>
else
  " In neovim, paste is automatic. If you need manual control:
  " Use :set paste and :set nopaste (or map to a key if desired)
endif

" ============================================================================
" FOLDING
" ============================================================================
" Use indent-based folding
set foldmethod=indent
" Alternative: syntax-based folding (commented out)
"set foldmethod=syntax

" Start with folds at level 3
set foldlevelstart=3

" Disable folding by default (zo to open fold, zc to close)
set nofoldenable

" Space + i sets fold method to indent (useful for switching fold methods)
nmap <silent> <leader>i :set foldmethod=indent<CR>

" ============================================================================
" ENCODING
" ============================================================================
" Set terminal encoding to UTF-8
" Note: Neovim is always UTF-8, so this is only for vim
if !has('nvim')
  set termencoding=utf-8
endif
" Alternative UTF-8 settings (commented out)
"set encoding=utf-8
"set fileencoding=utf-8

" ============================================================================
" INDENTATION SETTINGS
" ============================================================================
" Reference: https://stackoverflow.com/questions/14173766/vim-ignores-shiftwidth-specified-in-vimrc

" Round indent to multiple of shiftwidth
set shiftround

" Copy indent from current line to new line
set autoindent

" Use spaces instead of tabs
set expandtab

" Set tab width to 2 spaces
let s:tabwidth=2
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

" ============================================================================
" APPEARANCE & COLOR SCHEME
" ============================================================================
" Show line numbers in left margin
set number

" Don't wrap long lines (scroll horizontally instead)
set nowrap

" Hide default mode text (--INSERT--, etc.) since Lightline shows it
set noshowmode

" Fix line spacing (prevents underscore from disappearing in some terminals)
set linespace=3

" Toggle cursorline highlight when entering/leaving insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" ============================================================================
" COLOR SCHEME
" ============================================================================
" Use dark background variant
set background=dark

" Enable syntax highlighting
syntax enable

" Color scheme is set in plugins.vim (requires plugin to be loaded)

" Optional: Make background transparent (commented out)
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" ============================================================================
" CUSTOM SYNTAX HIGHLIGHTING
" ============================================================================
" Enable Brian's perlog syntax highlighting for .sv.pl files
" Located in  ~/.vim/syntax/, from his scratch space: /home/scratch.briyu_gpu/dotfiles/.vim/syntax
autocmd BufNewFile,BufRead *.sv.pl set filetype=perlog

autocmd BufNewFile,BufRead *.vx set filetype=viva
autocmd BufNewFile,BufRead *.svx set filetype=viva
autocmd BufNewFile,BufRead *.svxh set filetype=viva

" ============================================================================
" HIGHLIGHT CUSTOMIZATION
" ============================================================================
" Fix parenthesis/bracket matching highlight color
" Default is often hard to see - use white text on dark grey background
hi MatchParen cterm=NONE ctermfg=white ctermbg=darkgrey

" Optional: Customize search highlight color (commented out)
" Reference: https://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
"hi Search cterm=NONE ctermfg=grey ctermbg=blue
"hi Cursor guifg=black guibg=white

" ============================================================================
" WINDOW NAVIGATION (Leader + hjkl)
" ============================================================================
" Navigate between windows using Space + vim direction keys
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>

" Access all window commands with Space + w (like Ctrl-W)
nmap <silent> <leader>w <C-W>

" ============================================================================
" BUFFER NAVIGATION
" ============================================================================
" Allow hidden buffers (can switch buffers without saving)
set hidden

" Method 1: Ctrl + D/S for next/previous buffer
nnoremap <C-D> :bnext<CR>
nnoremap <C-S> :bprev<CR>

" Method 2: Leader + m/n for next/previous buffer (alternative to Ctrl+D/S)
nmap <silent> <leader>m :bn<CR>
nmap <silent> <leader>n :bp<CR>

" Switch to buffer by number (prompts for buffer number)
nnoremap <expr> <leader>s ":e#" . input("Switch to buffer #:") . "\<CR>"

" ============================================================================
" ENHANCED MOVEMENT KEYS
" ============================================================================
" Remap H/J/K/L for more intuitive movement
"     J jumps to bottom of screen (instead of join lines)
"     K jumps to top of screen (instead of man page)
"     H jumps to start of line (instead of top of screen)P
"     L jumps to end of line (instead of bottom of screen)
"     0 jumps to first non-whitespace char (instead of column 0)
nnoremap J L
nnoremap K H
nnoremap H 0
nnoremap L $
nnoremap 0 ^

" Up/Down move by display lines (useful for wrapped text)
nnoremap <Up> gk
nnoremap <Down> gj

" Smart Home key: toggle between first non-whitespace and column 0
function ExtendedHome()
    let column = col('.')
    normal! ^
    if column == col('.')
        let row = line('.')
        call cursor(row,1)
    endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

" End key jumps to last character (before newline)
noremap <End> g_

" ============================================================================
" SEARCH ENHANCEMENTS
" ============================================================================
" * highlights word under cursor WITHOUT jumping to next match
nmap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

" / searches with very magic mode (\v) and doesn't jump
" Very magic mode allows cleaner regex (use | for OR, no escaping needed)
nmap / :setl hls \| let @/ = '\v'.input('/')<cr>

" ============================================================================
" EDITING ENHANCEMENTS
" ============================================================================
" x and X delete without yanking to clipboard (use d for cut, x for delete)
noremap x "_x
xnoremap X "_X

" Remove all trailing whitespace in file (Space + u)
" Reference: https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
noremap <silent><leader>u :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" ============================================================================
" SYNTAX HIGHLIGHTING TOGGLE
" ============================================================================
" F4 toggles syntax highlighting on/off
" Useful for performance or when syntax highlighting causes issues
map <F4> :if exists("g:syntax_on") <Bar>
\   syntax off <Bar>
\ else <Bar>
\   syntax enable <Bar>
\ endif <CR>

