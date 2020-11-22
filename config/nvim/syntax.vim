" Ignore spell checking for CamelCased items.
" Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
autocmd Syntax * syn match CamelCase
  \ "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
  \ containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

" Ignore spell checking for URLs.
autocmd Syntax * syn match UrlNoSpell
  \ '\w\+:\/\/[^[:space:]"\']\+' transparent
  \ containedin=.*Comment.*,.*String.* contains=@NoSpell contained

" Ignore spell checking for apostrophes.
" TODO: Determine if this is only needed for the camel cased items above. If so, figure out how to
" integrate it with that rule.
autocmd Syntax * syn match UrlNoSpell
  \ '['']s[[:space:]]' transparent
  \ containedin=.*Comment.*,.*String.* contains=@NoSpell contained

" Always use two spaces for tabs
set tabstop=2 shiftwidth=2 expandtab

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
" purposes.
let g:is_posix = 1

" Display extra whitespace characters
set list listchars=tab:»·,trail:·,nbsp:·
