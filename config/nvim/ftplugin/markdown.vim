source ~/.thoughtbot_dotfiles/vim/ftplugin/markdown.vim

" Always wrap at 100 characters
setlocal textwidth=100

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/

function! MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

call MatchTechWordsToAvoid()

autocmd BufWinEnter * call MatchTechWordsToAvoid()
autocmd InsertEnter * call MatchTechWordsToAvoid()
autocmd InsertLeave * call MatchTechWordsToAvoid()
