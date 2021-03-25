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
nnoremap <bs> <c-w>h

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
cabbrev remove <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "remove"<cr>
cabbrev delete <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "delete"<cr>
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

" Use left and right for navigating tabs
nnoremap <left> gT
nnoremap <right> gt

" Remap H and L for navigating tabs. Disable gt and gT to prevent hitting them by habit.
nnoremap H gT
nnoremap L gt
nnoremap gT <nop>
nnoremap gt <nop>

" Automatically format JSON files using jq
nnoremap <leader>jq :%!jq '.'<cr>

" Fix the tab behavior for Deoplete (by reversing it)
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Make the double register use the system clipboard
nnoremap "" "*

" Remap [[ and ]] to jump to errors.
nnoremap <silent> [[ :lnext<cr>
nnoremap <silent> ]] :lprev<cr>

" Configure the language client commands
nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>ll :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lg :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>

" Create more convenient shortcuts for yanking to the system keyboard and pasting from the system
" keyboard.
nnoremap <silent> gy "*y
nnoremap <silent> gp "*p
nnoremap <silent> gY "*y$
xnoremap <silent> gy "*y<cr>
xnoremap <silent> gp "*p<cr>

" Disable Ex mode
nnoremap Q <nop>
nnoremap gQ <nop>
