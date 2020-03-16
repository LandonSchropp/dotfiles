" Unfortunately, the JavaScript syntax theme that ships with Vim Polyglot turns on spell check of
" JavaScript strings. This disabled that functionality.
"
" https://github.com/sheerun/vim-polyglot/issues/468

syntax clear jsString
syntax clear jsTemplateString
syntax clear jsObjectKeyString
syntax clear jsObjectStringKey

syntax region jsString start=+\z(["']\)+ skip=+\\\%(\z1\|$\)+ end=+\z1+ end=+$+ contains=jsSpecial extend
syntax region jsTemplateString start=+`+ skip=+\\`+ end=+`+ contains=jsTemplateExpression,jsSpecial extend
syntax region jsObjectKeyString contained start=+\z(["']\)+ skip=+\\\%(\z1\|$\)+ end=+\z1\|$+ contains=jsSpecial skipwhite skipempty nextgroup=jsObjectValue
syntax region jsObjectStringKey contained start=+\z(["']\)+ skip=+\\\%(\z1\|$\)+ end=+\z1\|$+ contains=jsSpecial extend skipwhite skipempty nextgroup=jsFuncArgs,jsObjectValue
