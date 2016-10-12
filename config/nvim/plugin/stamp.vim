" Create Stamp (S) operator
nmap <silent> S :set opfunc=Stamp<CR>g@
vmap <silent> S :<C-U>call Stamp(visualmode(), 1)<CR>

function! Stamp(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gv\"_dP"
  elseif a:type == 'line'
    silent exe "normal! '[V']\"_dP"
  else
    silent exe "normal! `[v`]\"_dP"
  endif

  let &selection = sel_save
  let @@ = reg_save
endfunction
