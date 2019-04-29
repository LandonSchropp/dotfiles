" This is my custom Airline theme.

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
