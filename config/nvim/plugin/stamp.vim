" Create Stamp (S) operator
nmap <silent> S :set opfunc=Stamp<CR>g@

function! Stamp(type)
  let saved_register = @@

  " This command does the following:
  "
  " 1. Visually select the last motion (which would be the motion used to call the Stamp script.
  " 2. Escape to de-select the motion. This populates the `< and `> marks.
  " 3. Insert a # character after the motion. This prevents the paste before from breaking when
  "    there are no characters after the current motion (e.g. $).
  " 4. Visually select the previously visually selected text.
  " 5. Delete the selected text without updating the 0 register.
  " 6. Paste the text from the 0 register.
  " 7. Remove the added # charater.
  silent execute "normal! `[v`]\<esc>`]a#\<esc>`<v`>\"_dPl\"_x"

  let @@ = saved_register
endfunction
