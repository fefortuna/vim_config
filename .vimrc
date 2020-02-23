set clipboard=exclude:.*
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
set number

set nowrap
set autochdir

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
"""" enable 24bit true color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"""" enable the theme
" color scheme from https://github.com/Rigellute/rigel
syntax enable
colorscheme rigel
let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }


"--------------------
" BufTabLine Theming
"--------------------
    "Custom group            	Default link      	Meaning
    "*BufTabLineCurrent*        |TabLineSel|        Buffer shown in current window
    "*BufTabLineActive*         |PmenuSel|          Buffer shown in other window
    "*BufTabLineHidden*         |TabLine|           Buffer not currently visible
    "*BufTabLineFill*           |TabLineFill|       Empty area
"to see the colors of your current color scheme, run
":so $VIMRUNTIME/syntax/hitest.vim
"Example of how to link BufTabLine colors to one of your color-scheme colors:
"hi link BufTabLineCurrent ColorColumn
"this will make the current buffer tab share the same color as the Color
"Column syntax highlight group

hi link BufTabLineActive StatusLine
" Show buffer numbers in the tabline
let g:buftabline_numbers = 1

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
" based off modified version of answer from:
" https://stackoverflow.com/questions/2035800/pressing-home-in-vim-on-an-indented-line 
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

" Map end key to jump to end of line but before the newline char
noremap <End> g_

" move between buffers
set hidden
nnoremap <C-D> :bnext<CR>
nnoremap <C-A> :bprev<CR>

"========================================
" Misc
"========================================
