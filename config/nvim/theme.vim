" Change the cursor when in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable truecolor
" if has("nvim")
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif

" Highlight the current line
set cursorline

" Use Powerline fonts with Airline.
let g:airline_powerline_fonts = 1

" Load the themes
source ~/.config/nvim/themes/landon.vim
source ~/.config/nvim/themes/landon_custom.vim
