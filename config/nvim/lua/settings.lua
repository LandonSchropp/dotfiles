-- COLUMNS

-- The maximum width of the text being inserted
vim.api.nvim_set_option("textwidth", 100)

-- Wrap characters at the breakat point rather than the edge of the screen
vim.api.nvim_set_option("linebreak", true)

-- When text wraps, it should continue to be indented
vim.api.nvim_set_option("breakindent", true)

-- Highlight the line after the textwidth
vim.api.nvim_set_option("colorcolumn", "+1")

-- SEARCH

-- Ignore case when searching
vim.api.nvim_set_option("ignorecase", true)

-- TABS

-- The number of spaces a tab counts for
vim.api.nvim_set_option("tabstop", 2)

-- The number of spaces to use for indentation step
vim.api.nvim_set_option("shiftwidth", 2)

-- Round to multiples of the shift width
vim.api.nvim_set_option("shiftround", true)

-- Use the correct number of spaces to insert a tab in insert mode
vim.api.nvim_set_option("expandtab", true)

-- Indent by two spaces when wrapping
vim.api.nvim_set_option("breakindentopt", "shift:2")

-- LINE NUMBERS

-- Use line numbers (who wouldn't want this?)
vim.api.nvim_set_option("number", true)

-- Make room for line numbers up to 9999
vim.api.nvim_set_option("numberwidth", 5)

-- Use relative line numbers
vim.api.nvim_set_option("relativenumber", true)

-- OTHER

-- Don't create swapfiles.
vim.api.nvim_set_option("swapfile", false)

-- Don't create backups before overwriting files.
vim.api.nvim_set_option("writebackup", false)

-- Use an undo file for persistent undos
vim.api.nvim_set_option("undofile", true)

-- Automatically :write before running commands
vim.api.nvim_set_option("autowrite", true)

-- Only join with one space after punctuation
vim.api.nvim_set_option("joinspaces", false)

-- Turn off modelines
vim.api.nvim_set_option("modeline", false)

-- Automatically read changes to files edited outside of Vim
vim.api.nvim_set_option("autoread", true)

-- Ensure there's always a little space above and below the current line
vim.api.nvim_set_option("scrolloff", 2)

-- Open horizontal splits below the current pane
vim.api.nvim_set_option("splitbelow", true)

-- Open vertical splits to the right of the current pane
vim.api.nvim_set_option("splitright", true)

-- Incrementally show effects of commands
vim.api.nvim_set_option("inccommand", "nosplit")

-- Do not redraw the screen in the middle of a macro
vim.api.nvim_set_option("lazyredraw", true)

-- Enable spell checking
vim.api.nvim_set_option("spell", true)

-- NOTE: This has to be run with autocmd in order to override the ftplugins
-- l: Automatically wraps long lines in insert mode
-- t: Autowrap text using textwidth
-- r: Automatically continue comments when hitting enter
--
-- TODO: Replace this with native autocommands when they're added.
vim.cmd("autocmd BufNewFile,BufRead * setlocal formatoptions-=ltr")

-- Use Ripgrep in CtrlP for listing files.
vim.api.nvim_set_var('ctrlp_user_command', 'rg %s --files --color=never --hidden --glob ""')
vim.api.nvim_set_var('ctrlp_use_caching', 0)

-- Ripgrep is fast enough that CtrlP doesn't need to cache the files
vim.api.nvim_set_var('ctrlp_use_caching', 0)

-- Add wildcards for CtrlP and Vim to ignore
vim.api.nvim_set_option("wildignore", vim.o.wildignore .. "*/tmp/*,*.zip,*/build/*,*.png,*.gif,*.jpg")

vim.api.nvim_set_var('ctrlp_custom_ignore', {
  file = '\\v\\.(zip,png,gif,jpg)$',
  dir = '\\v(build|tmp|log)'
})

-- Make opening a file in a new tab the default in CtrlP.
vim.api.nvim_set_var('ctrlp_prompt_mappings ', {
  ['AcceptSelection("e")'] = { '<c-t>' },
  ['AcceptSelection("t")'] = { '<cr>', '<2-LeftMouse>' }
})

-- Use the_silver_searcher over grep. I'm only setting this in case a plugin or an internal command
-- uses grep.
--
-- TODO: Replace this with Ripgrep
vim.api.nvim_set_option("grepprg", "ag --nogroup --nocolor")

-- User the silver searcher for Ack.
--
-- TODO: Replace this with Ripgrep
vim.api.nvim_set_var('ackprg', 'ag --vimgrep')

-- Remove the delay when hitting the escape key
vim.api.nvim_set_option("timeoutlen", 2000)
vim.api.nvim_set_option("ttimeoutlen", 0)

-- Use regular line numbers in insert mode and relative numbers everywhere else
vim.cmd("autocmd InsertEnter * :set number norelativenumber")
vim.cmd("autocmd InsertLeave * :set relativenumber")

-- Wrap Git commit messages at 72 characters.
vim.cmd("autocmd FileType gitcommit set textwidth=72")

-- Use Deoplete.
vim.api.nvim_set_var('deoplete#enable_at_startup', 1)
vim.cmd("call deoplete#custom#option('auto_complete_delay', 0)")

-- Update the file types for the close tag plugin
vim.api.nvim_set_var('closetag_filenames', '*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs')

-- Prevent HTML tags from being expanded in HTML-esque files in delimitMate
vim.cmd("autocmd FileType html,erb,jsx,jade,pug,hbs let b:delimitMate_matchpairs = '(:),{:},[:]'")

-- Configure netrw
vim.api.nvim_set_var('netrw_liststyle', 3)
vim.api.nvim_set_var('netrw_banner ', 0)

-- Leave a file mark whenever I exit a buffer so I can jump back to that position.
-- Taken from: http://stackoverflow.com/a/16084326/262125
vim.cmd([[
  augroup VIMRC
    autocmd!

    autocmd BufLeave *.css  normal! mC
    autocmd BufLeave *.html normal! mH
    autocmd BufLeave *.js   normal! mJ
    autocmd BufLeave *.php  normal! mP
  augroup END
]])

-- Customize argwrap
vim.api.nvim_set_var('argwrap_padded_braces', '[{')

-- Set comment configuration file formats
vim.cmd('autocmd BufNewFile,BufRead .babelrc set syntax=json')
vim.cmd('autocmd BufNewFile,BufRead Procfile set syntax=yaml')
vim.cmd('autocmd BufNewFile,BufRead .envrc set syntax=sh')

-- Automatically run checktime whenever the Neovim window gains focus. This should make the autoread
-- behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
vim.cmd('autocmd FocusGained * :checktime')

-- Configure SplitJoin
vim.api.nvim_set_var('splitjoin_ruby_hanging_args ', 0)
vim.api.nvim_set_var('splitjoin_html_attributes_bracket_on_new_line', 1)
vim.api.nvim_set_var('splitjoin_ruby_options_as_arguments', 1)

-- Automatically format files on save.
vim.api.nvim_set_var('ale_fixers', {
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
  ruby = { 'rubocop' }
})

-- Disable the TypeScript server in JavaScript files.
vim.api.nvim_set_var('ale_linters_ignore', {
  javascript = { 'tsserver' },
  javascriptreact = { 'tsserver' }
})

vim.api.nvim_set_var('ale_fix_on_save ', 1)

-- Required for operations modifying multiple buffers like rename.
vim.api.nvim_set_option("hidden", true)

-- Configure the language servers
vim.api.nvim_set_var('LanguageClient_serverCommands', {
  javascript = { './node_modules/.bin/javascript-typescript-stdio' },
  javascriptreact = { './node_modules/.bin/javascript-typescript-stdio' },
  ruby = { 'bundle', 'exec', 'solargraph', 'stdio' }
})

-- Disable the language client's diagnostics
vim.api.nvim_set_var('LanguageClient_useVirtualText ', 'No')
vim.api.nvim_set_var('LanguageClient_diagnosticsEnable ', 0)

-- For some reason, ALE has recently become dependent on the completeopt setting, showing the
-- preview window whenever a word is tab completed. This setting turns off that behavior.
vim.api.nvim_set_option("completeopt", "menu")
