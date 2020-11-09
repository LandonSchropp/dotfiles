" Enable spellchecking
setlocal spell

" Always wrap at 100 characters
setlocal textwidth=100

" Automatically insert bullets when writing markdown
let g:vim_markdown_auto_insert_bullets = 1

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/

function! s:MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

call s:MatchTechWordsToAvoid()

autocmd BufWinEnter * call s:MatchTechWordsToAvoid()
autocmd InsertEnter * call s:MatchTechWordsToAvoid()
autocmd InsertLeave * call s:MatchTechWordsToAvoid()
