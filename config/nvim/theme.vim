" Change the cursor when in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable GUI colors
set termguicolors

" Highlight the current line
set cursorline

" Use Powerline fonts with Airline
let g:airline_powerline_fonts = 1

" Use a light background
set background=light

" Load the custom theme
source ~/.config/nvim/themes/landon.vim

" Search
Base16Highlight Search fg=blue bg=white
Base16Highlight IncSearch fg=blue bg=white

" Selection
Base16Highlight Visual fg=white bg=yellow
Base16Highlight CursorLineNR fg=blue

" Comments
Base16Highlight Todo fg=light2 bg=white reverse
Base16Highlight Comment italic
Base16Highlight Italic italic

" Menus
Base16Highlight PmenuSel fg=purple bg=light3
Base16Highlight PmenuSbar fg=white

" Window components
Base16Highlight ColorColumn bg=light3

" Diffs
Base16Highlight GitGutterAddDefault fg=green bg=light3
Base16Highlight GitGutterChangeDefault fg=yellow bg=light3
Base16Highlight GitGutterDeleteDefault fg=red bg=light3

" Errors and warnings
Base16Highlight NeomakeErrorDefault fg=white bg=red
Base16Highlight NeomakeErrorSignDefault fg=white bg=red
Base16Highlight NeomakeWarningSignDefault fg=white bg=yellow
Base16Highlight Warning fg=white bg=yellow

" Tab bar
Base16Highlight TabLine none
Base16Highlight TabLineSel fg=white bg=dark2 none
Base16Highlight TabLineFill none

" TODO: Style the cursor
" TODO: Style Vim Airline
" TODO: Make the colors a little more colorful
" TODO: Try to remove the ugly yellow color from code styling
" Base16Highlight Cursor     fg=red   bg=blue
