" start pathogen plugin manager
call pathogen#infect()

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

" Keep search results highlighted after pressing enter (press ctrl+l or use :noh to unhighlight)
" https://superuser.com/questions/345215/vim-how-do-you-efficiently-search-for-text
set hlsearch

" get vim working with GUI clipboard
set clipboard=unnamedplus

" set timeout length faster
set ttimeoutlen=50

"================================================== 
"INDENTATION SETTINGS
"================================================== 
" https://stackoverflow.com/questions/14173766/vim-ignores-shiftwidth-specified-in-vimrc
set shiftround  " Round indent to multiple of 'shiftwidth'
set autoindent  " Copy indent from current line, over to the new line
set expandtab   " Use spaces instead of tabs
" Set the tab width
let s:tabwidth=4
"exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

au filetype pb setl ts=2 sw=2 sts=2 et
au filetype yaml setl ts=2 sw=2 sts=2 et
au filetype python setl ts=4 sw=4 sts=4 et
au filetype csr setl ts=2 sw=2 sts=2 et
au filetype verilog setl ts=8 sw=3 sts=3 et
au filetype pl setl ts=8 et

"================================================== 
" APPEARANCE & COLOR SCHEME SETTINGS
"================================================== 
runtime appearance.vim

"================================================== 
" KEY MAPPINGS
"================================================== 
runtime keymaps.vim

"================================================== 
" MARVELL-SPECIFIC MAPPINGS AND FUNCTIONS
"================================================== 

runtime marvell.vim
