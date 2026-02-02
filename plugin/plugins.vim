
" ============================================================================
" PLUGIN: FILEBEAGLE
" ============================================================================
" What: Lightweight file browser/explorer for vim
" How:  Opens a full-screen file manager to browse and open files
" Usage:
"   -        - Open FileBeagle (or go up one directory when already open)
"   Enter    - Open file or enter directory
"   gh       - Toggle hidden files (dotfiles)
"   v        - Open in vertical split
"   s        - Open in horizontal split
"   t        - Open in new tab
"   %        - Create new file
"   d        - Create new directory
" Repo: https://github.com/jeetsukumaran/vim-filebeagle
" ============================================================================

" Optional: Show hidden files by default in file manager (commented out)
" Press 'gh' in FileBeagle to toggle hidden files dynamically instead
"let g:filebeagle_show_hidden=1

" ============================================================================
" PLUGIN: VIM-ROOTER
" ============================================================================
" What: Automatically changes working directory to project root
" How:  Searches for .git/, Makefile, etc. and changes to that directory
" Usage:
"   - Manual mode (current setting): Run :Rooter to change to project root
"   - Auto mode: Automatically changes directory when opening files
" Repo: https://github.com/airblade/vim-rooter
" ============================================================================

" Set vim-rooter to manual mode (use :Rooter to invoke manually)
" This prevents automatic directory changes - you control when it happens
let g:rooter_manual_only=1


" ============================================================================
" PLUGIN: LIGHTLINE
" ============================================================================
" What: Lightweight and configurable statusline plugin
" How:  Replaces vim's default statusline with a prettier, more informative one
" Usage:
"   - Automatically displays mode, git branch, filename, line info, etc.
"   - No keybindings needed - it's always visible
"   - Integrates with vim-fugitive for git branch display
" Repo: https://github.com/itchyny/lightline.vim
" ============================================================================

" Always show the status line (2 = always visible)
set laststatus=2

" Configure Lightline appearance and components
let g:lightline={
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

" Enable Rigel theme for Lightline statusbar
let g:rigel_lightline = 1

" Left side shows: mode, paste indicator, git branch, filename, modified status
" Right side shows: line info, percentage, file format/encoding/type, char hex


" ============================================================================
" PLUGIN: BUFTABLINE
" ============================================================================
" What: Shows open buffers as tabs at the top of the window
" How:  Displays buffer numbers and names in a tab-like interface
" Usage:
"   - Use buffer navigation keys to switch (Ctrl+D/S or Space+m/n)
"   - Buffer numbers shown next to names for quick switching
"   - Modified indicator shows unsaved changes
" Repo: https://github.com/ap/vim-buftabline
" ============================================================================

" Show buffer numbers in the tabline (use <leader>m/n or Ctrl-D/S to switch)
let g:buftabline_numbers = 1

" Show buffer indicators (modified, etc.)
let g:buftabline_indicators = 1

" Customize BufTabLine colors by linking to existing highlight groups
hi link BufTabLineCurrent ToolbarLine   " Active buffer in current window
hi link BufTabLineActive StatusLine     " Active buffer in other window
" Additional available groups:
"   BufTabLineHidden  - Buffer not currently visible (default: TabLine)
"   BufTabLineFill    - Empty area (default: TabLineFill)


" ============================================================================
" PLUGIN: NERDCOMMENTER
" ============================================================================
" What: Easy commenting/uncommenting of code
" How:  Intelligently comments code based on filetype
" Usage:
"   Space + /  - Toggle comment on current line or visual selection
"   Works in normal mode (current line) or visual mode (selection)
" Repo: https://github.com/preservim/nerdcommenter
" ============================================================================

" Enable commenting on empty lines
let g:NERDCommentEmptyLines = 1

" Custom comment delimiters 
let g:NERDCustomDelimiters = {
    \ 'perlog': { 'left': '//' },
    \ 'viva': { 'left': '//' },
\ }

" Space + / toggles comment on current line or selection
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle


" ============================================================================
" PLUGIN: EASYALIGN
" ============================================================================
" What: Align text by delimiters (=, :, |, etc.)
" How:  Enter interactive mode, choose delimiter, and text aligns automatically
" Usage:
"   Visual mode: Select text, type 'ea', then press delimiter (like = or :)
"   Normal mode: Type 'ea' followed by motion (like 'eaip' for paragraph)
"   Example: Select lines with '=', press 'ea' then '=', aligns on equals signs
" Repo: https://github.com/junegunn/vim-easy-align
" Note: Has a bug with whitespace tables when syntax highlighting is on
"       Use F4 to toggle syntax off if alignment doesn't work
" ============================================================================

" Ignore no groups (align everything)
let g:easy_align_ignore_groups=[]

" Start interactive EasyAlign in visual mode (e.g., vip then ea)
xmap ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g., eaip)
nmap ea <Plug>(EasyAlign)


" ============================================================================
" PLUGIN: GITGUTTER
" ============================================================================
" What: Shows git diff indicators in the gutter (left margin)
" How:  Displays +/~/- symbols next to lines that were added/modified/deleted
" Usage:
"   - Automatically shows changes in gutter
"   - No keybindings configured (default mappings disabled)
"   - Visual indicator of what changed since last commit
" Repo: https://github.com/airblade/vim-gitgutter
" ============================================================================

" Disable GitGutter's default key mappings
let g:gitgutter_map_keys = 0

" Optional: Refresh GitGutter and redraw screen (commented out)
"nmap <silent><leader>g :GitGutterAll<CR><C-l>


" ============================================================================
" COLOR SCHEME
" ============================================================================
" Set color scheme to Rigel (https://github.com/Rigellute/rigel)
colorscheme rigel
" Alternative color schemes (commented out):
"colorscheme wombat
"colorscheme xcodedark

