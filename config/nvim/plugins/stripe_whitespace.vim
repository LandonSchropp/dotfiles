" Removes all extraneous whitespace in the file
" Pulled from: https://github.com/ntpeters/vim-better-whitespace
function! s:StripWhitespace()

  " Save the current search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Strip the whitespace
  silent! exec ':%s/\s\+$//e'

  " Restore the saved search and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Strip trailing whitespace from files on save
autocmd BufWritePre * call <SID>StripWhitespace()
