" Renames the current file's extension to the provided extension.
function! s:ToBase64() range

  " " Save cursor position
  " let l:cursor_position = getpos(".")

  " Store the old register value
  let previous_register_value = getreg('z')
  let previous_register_type = getregtype('z')

  " Grab the selected text and store it in the register
  normal "zy

  echo @z

  " let [ l:line_start, l:column_start ] = getpos("'<")[1:2]
  " let [ l:line_end, l:column_end ] = getpos("'>")[1:2]
  " let l:selected_text = getline(line_start, line_end)
  "
  " echo l:selected_text
  "
  " normal mzv$hc
  " call
  "
  "
  " Repeatable nnoremap <leader>t64 mzv$hc<c-r>=system('base64', @")<cr><esc>kJ$x`z
  " Repeatable nnoremap <leader>f64 mzv$hc<c-r>=system('base64 --decode', @")<cr><esc>`z
  " let l:source_file = expand("%:p")
  " let l:destination_file = expand("%:r") . "." . a:extension
  "
  " silent! execute "saveas! " . l:destination_file
  "
  " if expand("%:p") !=# l:source_file && filewritable(expand("%:p"))
  "   silent execute "bwipe! " . l:source_file
  "   call delete(l:source_file)
  " endif

  " Restore the old register value
  " call setreg('z', previous_register_value, previous_register_type)

  " Restore the cursor position
  " call setpos('.', l:cursor_position)

endfunction

command! -range=% ToBase64 call s:ToBase64(<f-args>)
