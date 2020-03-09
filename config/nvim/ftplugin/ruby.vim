" Disable the Sorbet linter.
let s:linters = ale#fix#registry#GetApplicableFixers('ruby')
call remove(s:linters, index(s:linters, 'sorbet'))
let b:ale_linters = s:linters
