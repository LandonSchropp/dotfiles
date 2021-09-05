" Renames the current file's extension to the provided extension.
function! s:RenameExtension(extension)
  let l:source_file = expand("%:p")
  let l:destination_file = expand("%:r") . "." . a:extension

  silent! execute "saveas! " . l:destination_file

  if expand("%:p") !=# l:source_file && filewritable(expand("%:p"))
    silent execute "bwipe! " . l:source_file
    call delete(l:source_file)
  endif
endfunction

command! -nargs=1 RenameExtension call s:RenameExtension(<f-args>)
