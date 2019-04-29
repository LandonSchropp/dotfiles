call plug#begin('~/.vim/bundle')



" GENERAL

" Fast file switching
Plug 'ctrlpvim/ctrlp.vim'

" Project searching
Plug 'mileszs/ack.vim'

" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'

" Shows the current git diff in the gutter.
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'w0rp/ale'

" Quickly run Unix commands.
Plug 'tpope/vim-eunuch'

" Automatically resize open splits so the current is the biggest
Plug 'roman/golden-ratio'

" Better buffer deletion handling.
Plug 'moll/vim-bbye'

" Automatically create any non-existent directories before writing the buffer
Plug 'pbrisbin/vim-mkdir'

" Tools for editing Rails projects
Plug 'tpope/vim-rails'

" Enable support for the repeat command with other plugins
Plug 'tpope/vim-repeat'

" Extra commands for surrounding text
Plug 'tpope/vim-surround'

" Vim testing
Plug 'junegunn/vader.vim'



" TEXT EDITING

" Auto-completes quotes, brackets, etc.
Plug 'Raimondi/delimitMate'

" Automatically close HTML tags
Plug 'alvan/vim-closetag'

" Quickly jump to words and characters in a file
Plug 'easymotion/vim-easymotion'

" Provides new motions to target when running operators
Plug 'wellle/targets.vim'

" Better auto-completion
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }

" Automatically add end in Ruby
Plug 'tpope/vim-endwise'

" Quick commenting
Plug 'vim-scripts/tComment'

" Wrap and unwrap arguments and curly braces.
Plug 'AndrewRadev/splitjoin.vim'

" TypeScript support
Plug 'mhartington/nvim-typescript'

" Base 64 encoding/decoding
Plug 'christianrondeau/vim-base64'
Plug 'kreskij/Repeatable.vim', { 'on': 'Repeatable' }

" Easy text replacement.
" Plug 'LandonSchropp/vim-stamp'



" SYNTAX PLUGINS

" Language syntax highlighting
Plug 'sheerun/vim-polyglot'

" Nunjucks
Plug 'Glench/Vim-Jinja2-Syntax'

" Gemfiles
Plug 'tpope/vim-bundler'

" Highlight CSS colors
Plug 'ap/vim-css-color'

" CSS3
Plug 'LandonSchropp/vim-css3-syntax'

" Jsonnet
Plug 'google/vim-jsonnet'



" THEMES

" Better Vim status bar
Plug 'vim-airline/vim-airline'

call plug#end()
