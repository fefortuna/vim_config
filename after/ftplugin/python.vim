
" PyMTL convention uses 2 spaces for indentation
" When opening .py files, check if they are PyMTL code, then set indentation
" settings if necessary. Based off this post:
" https://stackoverflow.com/questions/21073496/why-does-vim-not-obey-my-expandtab-in-python-files
if search("pymtl3")!=0
    setlocal softtabstop=2
    setlocal tabstop=2
    setlocal shiftwidth=2
endif
