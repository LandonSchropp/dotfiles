" Change the cursor when in insert mode
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
else
  if $TERM == 'screen' || $TERM == 'screen-256color'
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" Set the colorscheme
" TODO: Clean up the way the theme is sourced.
colorscheme base16-ateliersulphurpool
so ~/.config/nvim/landons_theme.vim
" colorscheme base16-landons-theme

" Enable truecolor
" TODO: Find a way to reuse the color variables defined in landons_theme.yml without having to
" hardcode the values.
" if has("nvim")
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif

" Highlight the current line
set cursorline

" Adjust the colors
highlight Comment cterm=italic gui=italic
highlight Cursor ctermfg=0 ctermbg=7
highlight CursorLine  ctermbg=13
highlight iCursor ctermfg=0 ctermbg=15
highlight Visual ctermfg=0
highlight WildMenu ctermfg=15
highlight Folded ctermfg=0
highlight FoldColumn ctermfg=0
highlight DiffAdd ctermfg=0
highlight DiffChange ctermfg=0
highlight DiffDelete ctermfg=0
highlight Search ctermbg=13
highlight SignColumn ctermfg=0
highlight SpellBad ctermfg=0
highlight SpellCap ctermfg=0
highlight SpellRare ctermfg=0
highlight PmenuSbar ctermfg=0
highlight CursorColumn ctermfg=0
highlight ColorColumn ctermbg=13
highlight Todo ctermbg=15 ctermfg=6 cterm=reverse
highlight Italic cterm=italic

" Adjust warning and error colors
" NOTE: The reverse attribute fixes issues where the cursorline overrides the background colors.
highlight Error ctermbg=13 ctermfg=1 cterm=reverse
highlight Warning ctermbg=13 ctermfg=3 cterm=reverse

" Set up Airline
let g:airline_powerline_fonts = 1
let g:airline#themes#custom#palette = {}

let s:N1 = [ '#202746', '#f5f7ff', 0, 15 ]
let s:N2 = [ '#202746', '#dfe2f1', 0, 13 ]
let s:N3 = [ '#202746', '#a4abc4', 0, 7 ]
let g:airline#themes#custom#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [ '#202746', '#5fb391', 0, 2 ]
let s:I2 = [ '#202746', '#dfe2f1', 0, 13 ]
let s:I3 = [ '#202746', '#a4abc4', 0, 7 ]
let g:airline#themes#custom#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#custom#palette.replace = copy(g:airline#themes#custom#palette.insert)

let s:V1 = [ '#202746', '#c08b30', 0, 3 ]
let s:V2 = [ '#202746', '#dfe2f1', 0, 13 ]
let s:V3 = [ '#202746', '#a4abc4', 0, 7 ]
let g:airline#themes#custom#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:A1 = [ '#202746', '#c94c60', 0, 1 ]
let s:A2 = [ '#202746', '#dfe2f1', 0, 13 ]
let s:A3 = [ '#202746', '#a4abc4', 0, 7 ]
let g:airline#themes#custom#palette.inactive = airline#themes#generate_color_map(s:A1, s:A2, s:A3)
let g:airline_theme="custom"
