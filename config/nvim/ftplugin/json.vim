" Add support for comments.
syntax match Comment +\/\/.\+$+

" Prevent vim-json from concealing quotes
let g:vim_json_syntax_conceal = 0
