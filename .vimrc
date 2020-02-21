set clipboard=exclude:.*
" start pathogen plugin manager
execute pathogen#infect()

"================================================== 
"BASIC SETTINGS
"================================================== 
syntax on
filetype plugin indent on

" Enable mouse scroll
set mouse=a

" open new splits to the right, and on the bottom
set splitright
set splitbelow

" diables some annoying stuff when pasting into vim
set pastetoggle=<F3>
set number

"indentation settings
" https://stackoverflow.com/questions/14173766/vim-ignores-shiftwidth-specified-in-vimrc
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set expandtab   " Use spaces instead of tabs
" Set the tab width
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

" toggle cursorline when entering/leaving insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" set timeout length faster
set ttimeoutlen=50

"================================================== 
" COLOR SCHEME
"================================================== 
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
colorscheme onedark
let g:lightline = {
      \ 'colorscheme': 'one',
      \}

" make currently selected tab blue, and non-selected tabs grey
hi link BufTabLineCurrent PmenuSel
hi link BufTabLineActive TabLineSel

"================================================== 
" KEY MAPPINGS
"================================================== 
" space + hjkl for window navigation
let mapleader = "\<Space>" 
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>

" Comment current line/selection with <leader>+</>
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle

" In normal mode, make up and down keys move over wrapped lines
nnoremap <Up> gk
nnoremap <Down> gj

" Home goes to beginning of non-whitespace text, useful for indented lines
" https://stackoverflow.com/questions/2035799/pressing-home-in-vim-on-an-indented-line 
function ExtendedHome()
    let column = col('.')
    normal! ^
    if column == col('.')
        normal! 0
    endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

" Map end key to jump to end of line but before the newline char
noremap <End> g_

" move between buffers
set hidden
nnoremap <C-D> :bnext<CR>
nnoremap <C-A> :bprev<CR>

"========================================
" Misc
"========================================
