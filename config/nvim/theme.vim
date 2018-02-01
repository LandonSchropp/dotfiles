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

" TODO: Style the cursor
" TODO: Style Vim Airline

" Set Airline colors

" Normal Mode
let s:N1 = [ g:base16_color_dict['white'], g:base16_color_dict['purple'], 0, 0 ]
let s:N2 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light2'], 0, 0 ]
let s:N3 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Insert Mode
let s:I1 = [ g:base16_color_dict['white'], g:base16_color_dict['green'], 0, 0 ]
let s:I2 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light2'], 0, 0 ]
let s:I3 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Visual Mode
let s:V1 = [ g:base16_color_dict['white'], g:base16_color_dict['yellow'], 0, 0 ]
let s:V2 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light2'], 0, 0 ]
let s:V3 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Replace Mode
let s:R1 = [ g:base16_color_dict['white'], g:base16_color_dict['dark3'], 0, 0 ]
let s:R2 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light2'], 0, 0 ]
let s:R3 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Ctrl-P Mode
let s:C1 = [ g:base16_color_dict['white'], g:base16_color_dict['brown'], 0, 0 ]
let s:C2 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light2'], 0, 0 ]
let s:C3 = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Inactive Mode
let s:IA = [ g:base16_color_dict['dark3'], g:base16_color_dict['light3'], 0, 0 ]

" Warning Mode
let s:WI = [ g:base16_color_dict['white'], g:base16_color_dict['yellow'], 0, 0 ]

" Error Mode
let s:ER = [ g:base16_color_dict['white'], g:base16_color_dict['red'], 0, 0 ]

" Construct the palette
let g:airline#themes#landon#palette = {}

let g:airline#themes#landon#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#landon#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#landon#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#landon#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#landon#palette.ctrlp = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#landon#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

let g:airline#themes#landon#palette.normal.airline_warning = [ s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]
let g:airline#themes#landon#palette.insert.airline_warning = [ s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]
let g:airline#themes#landon#palette.visual.airline_warning = [ s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]
let g:airline#themes#landon#palette.ctrlp.airline_warning = [ s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]
let g:airline#themes#landon#palette.replace.airline_warning = [ s:WI[0], s:WI[1], s:WI[2], s:WI[3] ]

let g:airline#themes#landon#palette.normal.airline_error = [ s:ER[0], s:ER[1], s:ER[2], s:ER[3] ]
let g:airline#themes#landon#palette.insert.airline_error = [ s:ER[0], s:ER[1], s:ER[2], s:ER[3] ]
let g:airline#themes#landon#palette.visual.airline_error = [ s:ER[0], s:ER[1], s:ER[2], s:ER[3] ]
let g:airline#themes#landon#palette.ctrlp.airline_error = [ s:ER[0], s:ER[1], s:ER[2], s:ER[3] ]
let g:airline#themes#landon#palette.replace.airline_error = [ s:ER[0], s:ER[1], s:ER[2], s:ER[3] ]

" Enable the theme
let g:airline_theme = 'landon'
