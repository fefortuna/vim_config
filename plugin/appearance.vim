"================================================== 
" APPEARANCE & COLOR SCHEME SETTINGS
"================================================== 
" Lightline shows mode info, so hide the --INSERT-- text on the status line
set noshowmode
set number
set nowrap

" toggle cursorline when entering/leaving insert mode
:autocmd InsertEnter,InsertLeave * set cul!


"""" enable the theme
" color scheme from https://github.com/Rigellute/rigel
set background=dark
syntax enable
colorscheme rigel
"colorscheme wombat
"colorscheme xcodedark
let g:rigel_lightline = 1
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

"--------------------
" Lightline Theming
"--------------------
let g:lightline = {
      "\ 'colorscheme': 'rigel',
      "\ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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

hi link BufTabLineCurrent ToolbarLine
hi link BufTabLineActive StatusLine
" Show buffer numbers in the tabline
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Search Highlight Color
" https://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
hi Search cterm=NONE ctermfg=grey ctermbg=blue

