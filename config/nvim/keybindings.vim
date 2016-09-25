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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
imap <silent> <C-h> <C-o>h
imap <silent> <C-j> <C-o>j
imap <silent> <C-k> <C-o>k
imap <silent> <C-l> <C-o>l

" BUG FIX: iTerm2 incorrectly interprets <C-h> as a backspace. To work around that issue, I'm
" mapping backspace to the same action as <C-h>.
if has('nvim')
  nnoremap <bs> <C-w>h
endif

" Override the default tComment shortcut for visual mode
vnoremap gc gcc <Esc>

" Leader mappings
let mapleader = " "

" Run the currently selected spec
nnoremap <silent> <leader>tt :call RunNearestSpec()<CR>

" Run the last spec
nnoremap <silent> <leader>tl :call RunLastSpec()<CR>

" Run the current spec file
nnoremap <silent> <leader>ta :call RunCurrentSpecFile()<CR>

" Sort the currently selected lines
nnoremap <silent> <leader>abc :sort<CR>

" Search the files
nnoremap <leader>ag :Ag<Space>

" Show/hide NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" vim-test mappings
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tt :TestNearest<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Remap EasyMotion
nmap \ <Plug>(easymotion-prefix)

" Remap the paste key to set nopaste mode
nnoremap <silent> <M-p> :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Alias the Eunuch commands (expect for Move and Wall)
cabbrev remove <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Remove" : "remove"<CR>
cabbrev unlink <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Unlink" : "unlink"<CR>
cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<CR>
cabbrev chmod <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Chmod" : "chmod"<CR>
cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Mkdir" : "mkdir"<CR>
cabbrev find <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Find" : "find"<CR>
cabbrev locate <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Locate" : "locate"<CR>
cabbrev sudowrite <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudowrite" : "sudowrite"<CR>
cabbrev sudoedit <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudoedit" : "sudoedit"<CR>
