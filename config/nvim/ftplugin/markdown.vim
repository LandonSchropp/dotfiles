" Enable spellchecking
setlocal spell

" Always wrap at 100 characters
setlocal textwidth=100

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/

function! s:MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

call s:MatchTechWordsToAvoid()

autocmd BufWinEnter * call s:MatchTechWordsToAvoid()
autocmd InsertEnter * call s:MatchTechWordsToAvoid()
autocmd InsertLeave * call s:MatchTechWordsToAvoid()

" Wrap lists properly when using gq
" https://github.com/plasticboy/vim-markdown/issues/390
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_auto_insert_bullets = 0
autocmd BufRead,BufNewFile * setlocal comments=fb:>,fb:*,fb:+,fb:-
