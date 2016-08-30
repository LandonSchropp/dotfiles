" Sometimes certain buffers are BFFs, and like to be open at the same time. This plugin opens a
" companion buffer whenever its buddy is opened in the first window.

" The default search patterns and substitutions for the companion files.
let g:buddy_buffer_substitutions = [
\   ["^app/js/\\(.*\\)\\.js$", "test/unit/\\1_spec.js"],
\   ["^app/\\(.*\\)\\.rb$", "spec/\\1_spec.js"]
\ ]

" Makes sure the window is always split into the correct layout.
function! EnsureProperLayout()

  let l:number_of_windows = tabpagewinnr(tabpagenr(), '$')

  " Open a split, if necessary
  " TODO: Make this smart enough to ignore non-editable windows (e.g. help)
  if l:number_of_windows < 2
    vsp
  endif
endfunction

" Returns the path of the spec file corresponding to the provided path. If no file is found, this
" function returns 0.
function! SpecFilePath()
  for substitution in g:buddy_buffer_substitutions
    if bufname("%") =~ substitution[0]
      return substitute(bufname("%"), substitution[0], substitution[1], "")
    endif
  endfor
endfunction

" Using the current buffer's file name, this function opens the spec file in an alternate window.
" This function only works when the buffer is opened in the first window.
function! OpenBufferBuddy()

  " Only consider buffers that were opened in the first window
  if winnr() != 1
    return
  endif

  " If the file does not match the expected pattern, ignore it
  let l:spec_file_path = SpecFilePath()
  if (type(l:spec_file_path) == type(0) && l:spec_file_path == 0)
    return
  endif

  " Set up the layout
  call EnsureProperLayout()

  " Edit the spec file
  2wincmd w
  execute "edit" l:spec_file_path
  1wincmd w

endfunction

" Automatically open the BFF file when a buffer is opened or read.
" TODO: Parameterize the file types.
autocmd BufNewFile,BufRead *.js,*.rb call OpenBufferBuddy()
