" Columns
set textwidth=100          " The maximum width of the text being inserted
set linebreak              " Wrap characters at the breakat point rather than the edge of the screen
set breakindent            " When text wraps, it should continue to be indented
set colorcolumn=+1         " Highlight the line after the textwidth

" Search
set ignorecase             " Ignore case when searching

" Tabs
set tabstop=2              " The number of spaces a tab counts for
set shiftwidth=2           " The number of spaces to use for indentation step
set shiftround             " Round to multiples of the shift width
set expandtab              " Use the correct number of spaces to insert a tab in insert mode
set breakindentopt=shift:2 " Indent by two spaces when wrapping

" Line numbers
set number                 " Use line numbers (who wouldn't want this?)
set numberwidth=5          " Make room for line numbers up to 9999
set relativenumber         " Use relative line numbers

" Other standard editor configuration
set autowrite              " Automatically :write before running commands
set nojoinspaces           " Only join with one space after punctuation
set nomodeline             " Turn off modelines
set autoread               " Automatically read changes to files edited outside of Vim
set scrolloff=2            " Ensure there's always a little space above and below the current line

" NOTE: This has to be run with autocmd in order to override the ftplugins
" l: Automatically wraps long lines in insert mode
" t: Autowrap text using textwidth
" r: Automatically continue comments when hitting enter
autocmd BufNewFile,BufRead * setlocal formatoptions-=ltr

" Add wildcards for CtrlP and Vim to ignore
set wildignore+=*/tmp/*,*.zip,*/build/*,*.png,*.gif,*.jpg
let g:ctrlp_custom_ignore = {
  \  'file': '\v\.(zip,png,gif,jpg)$',
  \  'dir': '\v(build|tmp|log)'
  \ }

" Make opening a file in a new tab the default in CtrlP.
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }

" Strip trailing whitespace from files on save
autocmd BufWritePre * call <SID>StripWhitespace()

" Removes all extraneous whitespace in the file
" Pulled from: https://github.com/ntpeters/vim-better-whitespace
function! s:StripWhitespace()

  " Save the current search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Strip the whitespace
  silent! exec ':%s/\s\+$//e'

  " Restore the saved search and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Remove the delay when hitting the escape key
set timeoutlen=2000 ttimeoutlen=50

" Use regular line numbers in insert mode and relative numbers everywhere else
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber

" Wrap Git commit messages at 72 characters.
autocmd FileType gitcommit set textwidth=72

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Update the file types for the close tag plugin
let g:closetag_filenames = "*.html,*.erb,*.jade,*.pug,*.jsx"

" Prevent HTML tags from being expanded in HTML-esque files in delimitMate
autocmd FileType html,erb,jsx,jade,pug let b:delimitMate_matchpairs = '(:),{:},[:]'
