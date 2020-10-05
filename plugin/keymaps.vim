"================================================== 
" KEY MAPPINGS
"================================================== 
" space + hjkl for quick window navigation
let mapleader = "\<Space>" 
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>

" space + w for miscellaneous window commands
nmap <silent> <leader>w <C-W>

" Comment current line/selection with <leader>+</>
let g:NERDCommentEmptyLines = 1
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle

"nmap <silent> <leader>b :wincmd l<CR>
nnoremap <expr> <leader>s ":e#" . input("Switch to buffer #:") . "\<CR>"

" refresh gitgutter and redraw
nmap <silent><leader>g :GitGutterAll<CR><C-l>

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

noremap x "_x
xnoremap X "_X

" move between buffers
set hidden
nnoremap <C-D> :bnext<CR>
nnoremap <C-S> :bprev<CR>
" fb: Move between buffers with <leader> m and n
nmap <silent> <leader>m :bn<CR>
nmap <silent> <leader>n :bp<CR>

" fb: saner capitals
nnoremap J L
nnoremap K H
nnoremap H 0
nnoremap L $
nnoremap 0 ^



" diables some annoying stuff when pasting into vim
set pastetoggle=<F3>

" Easyalign bindings: see https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ea <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ea <Plug>(EasyAlign)

" toggle syntax highlighting with F4- EasyAlign has a bug where whitespace tables
" don't work if syntax highlighting is turned on
" https://github.com/junegunn/vim-easy-align/issues/134
map <F4> :if exists("g:syntax_on") <Bar>              
	\   syntax off <Bar>                             
	\ else <Bar>                                     
	\   syntax enable <Bar>                                  
	\ endif <CR>                                             

"========================================
" Misc
"========================================

" Disable gitgutter key mappings
let g:gitgutter_map_keys = 0
" Show hidden files in file manager
"let g:filebeagle_show_hidden=1
let g:easy_align_ignore_groups=[]



