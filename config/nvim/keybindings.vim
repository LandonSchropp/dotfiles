" Prevent the cursor from jumping when joining lines
nnoremap J mzJ`z

" Make Y's behavior match D and C
nnoremap Y y$

" Include wrapped lines when using the movement keys
set whichwrap+=<,>,h,l,[,]
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> 0 g0
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Remap H and L to beginning and end of lines (since ^ and $ are hard to type)
nnoremap H ^
nnoremap L $

" TODO: Don't include wrapped lines when jumping multiples (so relative line numbers work

" Allow control plus the movement keys to navigate the user in insert mode and normal mode
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
imap <silent> <c-h> <c-o>h
imap <silent> <c-j> <c-o>j
imap <silent> <c-k> <c-o>k
imap <silent> <c-l> <c-o>l

" BUG FIX: iTerm2 incorrectly interprets <c-h> as a backspace. To work around that issue, I'm
" mapping backspace to the same action as <c-h>.
if has('nvim')
  nnoremap <bs> <c-w>h
endif

" Override the default tComment shortcut for visual mode
vnoremap gc gcc <Esc>

" Leader mappings
let mapleader = " "
" Search
nnoremap <leader>f :Ack<Space>

" Toggle argwrap
nnoremap <silent> <leader>aw :ArgWrap<CR>

" vim-test mappings
nnoremap <silent> <leader>tf :call TestFile()<cr>
nnoremap <silent> <leader>ts :call TestSuite()<cr>

" Remap EasyMotion
nmap \ <Plug>(easymotion-prefix)

" Remap the paste key to set nopaste mode
nnoremap <silent> <M-p> :set paste<cr>o<esc>"*]p:set nopaste<cr>

" Alias the Eunuch commands (expect for Move and Wall)
cabbrev remove <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Remove" : "remove"<cr>
cabbrev unlink <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Unlink" : "unlink"<cr>
cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<cr>
cabbrev chmod <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Chmod" : "chmod"<cr>
cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Mkdir" : "mkdir"<cr>
cabbrev find <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Find" : "find"<cr>
cabbrev locate <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Locate" : "locate"<cr>
cabbrev sudowrite <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudowrite" : "sudowrite"<cr>
cabbrev sudoedit <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudoedit" : "sudoedit"<cr>

" Use the up arrow key to trigger a search through history.
nnoremap <up> :<up>

" Use _ and + for navigating tabs
nnoremap _ gT
nnoremap + gt

" Automatically format JSON files using jq
nnoremap <leader>jq :%!jq '.'<cr>

" Fix the tab behavior for Deoplete (by reversing it)
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Make the double register use the system clipboard
nnoremap "" "*

" Base64 encoding and decoding
" TODO: Find a better register to use.
Repeatable nnoremap <leader>t64 mzv$hc<c-r>=system('base64', @")<cr><esc>kJ$x`z
Repeatable nnoremap <leader>f64 mzv$hc<c-r>=system('base64 --decode', @")<cr><esc>`z
