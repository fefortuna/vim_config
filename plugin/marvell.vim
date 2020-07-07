"================================================== 
" MARVELL-SPECIFIC MAPPINGS AND FUNCTIONS
"================================================== 
nmap <silent> <leader>a :A<CR>
nmap <silent> <leader>d :D<CR>

" :A calls emacs verilog-mode autoexpansion. Note STDERR is not displayed,
" run autoexpand inside of emacs to see error messages.
" The original auto expand command is:
" command! A %!(cat >> $$.v; emacs --batch $$.v -f verilog-auto -f save-buffer >& /dev/null; cat $$.v; rm -f $$.v $$.v~)
command! A call s:AutoKeepLine()
function! s:AutoKeepLine()
   let rowText = getline(".")
   execute "%!(cat >> $$.v; emacs --batch $$.v -f verilog-auto -f save-buffer >& ~/log; cat $$.v; rm -f $$.v $$.v~)"
"   execute "%!(cat >> $$.v; auto.pl $$.v >& ~/log; cat $$.v; rm -f $$.v $$.v~)"
   silent execute "/" . rowText
   noh
endfunction
 
 " :D calls emacs verilog-mode delete autoexpansion. Note STDERR is not displayed,
 " run delete autoexpand inside of emacs to see error messages.
command! D %!(cat >> $$.v; emacs --batch $$.v -f verilog-delete-auto -f save-buffer >& /dev/null; cat $$.v; rm -f $$.v $$.v~)
  
" :L runs cn_lint on the file you are working on
"command! L Shell rir cn_lint -p %
"command! L Shell fixme_eg_cn_lint_wrapper %
"command! L Shell cn_lint %
command! L Shell rir -- cn_lint %
command! LC Shell rir --proj ccdev -- cn_lint %

" Just Type :VA (stands for Verbose Auto) to run the autos and pipe the output
" to a scratch buffer. This command is slower than A, but it gives you the
" output from auto.pl, which is useful sometimes. To undo autos, hit undo twice
command! -nargs=0 VA call s:ReAuto()
function! s:ReAuto()
   "%!cat >> VERBOSEAUTO.v
   "redraw!
   execute "silent Shell rir -- auto.pl %"
   call s:GotoLastBuf()
   execute "edit"
   "%!cat VERBOSEAUTO.v
   "silent !rm -f VERBOSEAUTO.v
   redraw!
endfunction

" Usage :Shell <shell command> <arguments>
" Used to issue Shell commands and direct the output to a new scratch buffer
" without leaving Vim
" NOTE: Will not close an existing Shell scratch buffer before opening a new
" one. Additonal scratch buffers will be created, but Vim will throw an error
" first
command! -complete=shellcmd -nargs=* Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
   let g:lastbuf = expand("%")
   echo a:cmdline
   let expanded_cmdline = a:cmdline
   for part in split(a:cmdline, ' ')
      if part[0] =~ '\v[%#<]'
         let expanded_part = fnameescape(expand(part))
         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
      endif
   endfor
   botright 15new
   setlocal buftype=nofile bufhidden=wipe noswapfile nowrap
   execute 'silent read !'. expanded_cmdline
   file ShellScratch
   setlocal nomodifiable
endfunction


