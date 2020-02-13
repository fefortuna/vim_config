" start pathogen plugin manager
execute pathogen#infect()

"
"BASIC SETTINGS
"
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

" COLOR SCHEME
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



" KEY MAPPINGS
"
"remap h to insert and use ijkl for inverse T cursor movement
map i <Up>
map j <Left>
map k <Down>
noremap h i
" bindings for ijkl split navigation
nmap <silent> <C-i>; :wincmd k<CR>
nmap <silent> <C-j>; :wincmd h<CR>
nmap <silent> <C-k>; :wincmd j<CR>
nmap <silent> <C-l>; :wincmd l<CR>



" set timeout length faster
set ttimeoutlen=50

" NerdCommenter bindings
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" move between buffers
set hidden
nnoremap <C-D> :bnext<CR>
nnoremap <C-A> :bprev<CR>

" allow backspace in normal mode
nnoremap <BS> X

" use ; instead of :
map ; :
noremap ;; ;

" make currently selected tab blue, and non-selected tabs grey
hi link BufTabLineCurrent PmenuSel
hi link BufTabLineActive TabLineSel
