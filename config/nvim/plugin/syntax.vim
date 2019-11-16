" Taken from here: https://stackoverflow.com/a/37040415
function! s:SyntaxGroupUnderCursor()
  let l:syntax_id = synID(line('.'), col('.'), 1)
  echo synIDattr(l:syntax_id, 'name') . ' → ' . synIDattr(synIDtrans(l:syntax_id), 'name')
endfun

command! SyntaxGroupUnderCursor call s:SyntaxGroupUnderCursor()
