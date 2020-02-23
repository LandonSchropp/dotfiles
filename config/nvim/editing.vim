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
set noswapfile             " Don't create swapfiles.
set nowritebackup          " Don't create backups before overwriting files.
set undofile               " Use an undo file for persistent undos
set autowrite              " Automatically :write before running commands
set nojoinspaces           " Only join with one space after punctuation
set nomodeline             " Turn off modelines
set autoread               " Automatically read changes to files edited outside of Vim
set scrolloff=2            " Ensure there's always a little space above and below the current line
set splitbelow             " Open horizontal splits below the current pane
set splitright             " Open vertical splits to the right of the current pane
set inccommand=nosplit     " Incrementally show effects of commands
set lazyredraw             " Do not redraw the screen in the middle of a macro
set spell                  " Turn on spell checking in comments

" Set the location of the spellfile
set spellfile=~/.config/nvim/spelling/en.utf-8.add

" Set the location of the dictionary
set dictionary+=/usr/share/dict/words

" NOTE: This has to be run with autocmd in order to override the ftplugins
" l: Automatically wraps long lines in insert mode
" t: Autowrap text using textwidth
" r: Automatically continue comments when hitting enter
autocmd BufNewFile,BufRead * setlocal formatoptions-=ltr

" Use the_silver_searcher in CtrlP for listing files.
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

" the_silver_searcher is fast enough that CtrlP doesn't need to cache the files
let g:ctrlp_use_caching = 0

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

" Use the_silver_searcher over grep. I'm only setting this in case a plugin or an internal command
" uses grep.
set grepprg=ag\ --nogroup\ --nocolor

" User the silver searcher for Ack.
let g:ackprg = 'ag --vimgrep'

" Remove the delay when hitting the escape key
set timeoutlen=2000 ttimeoutlen=0

" Use regular line numbers in insert mode and relative numbers everywhere else
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber

" Wrap Git commit messages at 72 characters.
autocmd FileType gitcommit set textwidth=72

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

" Update the file types for the close tag plugin
let g:closetag_filenames = "*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs"

" Prevent HTML tags from being expanded in HTML-esque files in delimitMate
autocmd FileType html,erb,jsx,jade,pug,hbs let b:delimitMate_matchpairs = '(:),{:},[:]'

" Configure netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Leave a file mark whenever I exit a buffer so I can jump back to that position.
" Taken from: http://stackoverflow.com/a/16084326/262125
augroup VIMRC
  autocmd!

  autocmd BufLeave *.css  normal! mC
  autocmd BufLeave *.html normal! mH
  autocmd BufLeave *.js   normal! mJ
  autocmd BufLeave *.php  normal! mP
augroup END

" Customize argwrap
let g:argwrap_padded_braces = '[{'

" Set comment configuration file formats
autocmd BufNewFile,BufRead .babelrc set syntax=json
autocmd BufNewFile,BufRead Procfile set syntax=yaml
autocmd BufNewFile,BufRead .envrc set syntax=sh

" Automatically run checktime whenever the Neovim window gains focus. This should make the autoread
" behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
autocmd FocusGained * :checktime

" Configure SplitJoin
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_html_attributes_bracket_on_new_line = 1

" Fix the *really* annoying nopaste bug in Neovim.
" TODO: Turn this off when the issue is resolved. (https://github.com/neovim/neovim/issues/7994)
autocmd InsertLeave * set nopaste

" Automatically format files on save.
let g:ale_fixers = { 'javascript': [ 'eslint' ], 'ruby': [ 'rubocop' ] }
let g:ale_fix_on_save = 1

" Required for operations modifying multiple buffers like rename.
set hidden

" Configure the language servers
let g:LanguageClient_serverCommands = {
  \ 'javascript': [ './node_modules/.bin/javascript-typescript-stdio' ],
  \ 'ruby': [ 'bundle', 'exec', 'solargraph', 'stdio' ],
  \ }

" Disable the language client's diagnostics
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_diagnosticsEnable = 0
