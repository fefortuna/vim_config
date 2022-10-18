" start pathogen plugin manager
call pathogen#infect()

"================================================== 
"BASIC SETTINGS
"================================================== 
syntax on
filetype plugin indent on

" Enable mouse scroll
set ttymouse=sgr
set mouse=a

" open new splits to the right, and on the bottom
set splitright
set splitbelow

" diables some annoying stuff when pasting into vim
set pastetoggle=<F3>

" Keep search results highlighted after pressing enter (press ctrl+l or use :noh to unhighlight)
" https://superuser.com/questions/345215/vim-how-do-you-efficiently-search-for-text
set hlsearch

" get vim working with GUI clipboard
set clipboard=unnamedplus

" set timeout length faster
set ttimeoutlen=50

" Ignore case when searching, except if upper-case is present
set ignorecase
set smartcase

" Keep this many lines above/below the cursor when scrolling
set scrolloff=3

" display command line's auto-complete as a menu
set wildmenu

" Fix backspace
set backspace=indent,eol,start

" Folding
set foldmethod=indent
"set foldmethod=syntax
set foldlevelstart=3

" Show tabs and trailing spaces
set list
set listchars=tab:>·
" set listchars=tab:>·,trail:·

set nofoldenable
" Set vim-rooter to manual (don't automatically change vim root, use :Rooter to invoke it manually.)
let g:rooter_manual_only=1

"================================================== 
"INDENTATION SETTINGS
"================================================== 
" https://stackoverflow.com/questions/14173766/vim-ignores-shiftwidth-specified-in-vimrc
set shiftround  " Round indent to multiple of 'shiftwidth'
set autoindent  " Copy indent from current line, over to the new line
set expandtab   " Use spaces instead of tabs
" Set the tab width
let s:tabwidth=2
"exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

"================================================== 
" APPEARANCE & COLOR SCHEME SETTINGS
"================================================== 
runtime appearance.vim

"================================================== 
" KEY MAPPINGS
"================================================== 
runtime keymaps.vim

