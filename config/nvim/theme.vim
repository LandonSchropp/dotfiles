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

" Customize the ALE warnings and errors
let g:ale_sign_error = '⚠ '
let g:ale_sign_warning = '⚠ '

highlight link ALEErrorSign Error
highlight link ALEWarningSign Warning

" Customize the default syntax themes provided by Base16 Builder. To see all of the highlights, run:
" :so $VIMRUNTIME/syntax/hitest.vim

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
Base16Highlight TechWordsToAvoid fg=white bg=yellow
Base16Highlight Warning fg=white bg=yellow

" Tab bar
Base16Highlight TabLine none
Base16Highlight TabLineSel fg=white bg=dark2 none
Base16Highlight TabLineFill none

" Syntax
Base16Highlight Statement fg=red
Base16Highlight Constant fg=yellow
Base16Highlight Identifier fg=blue

" Set the vim-airline theme to my custom theme.
let g:airline_theme = 'landon'
