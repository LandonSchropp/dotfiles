" Prevent vim-json from concealing quotes
let g:vim_json_syntax_conceal = 0

" Configure Vim Pencil
let g:pencil#wrapModeDefault = 'soft'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text call pencil#init()
" augroup END

" Ignore spell checking for camelcased items.
" Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
autocmd Syntax * syn match CamelCase
  \ "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
  \ containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

" Ignore spell checking for URLs.
autocmd Syntax * syn match UrlNoSpell
  \ '\w\+:\/\/[^[:space:]"\']\+' transparent
  \ containedin=.*Comment.*,.*String.* contains=@NoSpell contained

" Set the filetypes for extensions Vim doesn't recognize by default
autocmd BufRead,BufNewFile *.njk set filetype=jinja

" Always use two spaces for tabs
set tabstop=2 shiftwidth=2 expandtab

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
" purposes.
let g:is_posix = 1

" Display extra whitespace characters
set list listchars=tab:»·,trail:·,nbsp:·

" Add support for comments to JSON when writing JSONC.
autocmd FileType json syntax match Comment +\/\/.\+$+
