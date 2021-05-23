local utilities = require('utilities')
local set_option = utilities.set_option
local set_variable = utilities.set_variable
local auto_command = utilities.auto_command

-- COLUMNS

-- The maximum width of the text being inserted
set_option("textwidth", 100)

-- Wrap characters at the breakat point rather than the edge of the screen
set_option("linebreak", true)

-- When text wraps, it should continue to be indented
set_option("breakindent", true)

-- Highlight the line after the textwidth
set_option("colorcolumn", "+1")

-- SEARCH

-- Ignore case when searching
set_option("ignorecase", true)

-- TABS

-- The number of spaces a tab counts for
set_option("tabstop", 2)

-- The number of spaces to use for indentation step
set_option("shiftwidth", 2)

-- Round to multiples of the shift width
set_option("shiftround", true)

-- Use the correct number of spaces to insert a tab in insert mode
set_option("expandtab", true)

-- Indent by two spaces when wrapping
set_option("breakindentopt", "shift:2")

-- LINE NUMBERS

-- Use line numbers (who wouldn't want this?)
set_option("number", true)

-- Make room for line numbers up to 9999
set_option("numberwidth", 5)

-- Use relative line numbers
set_option("relativenumber", true)

-- OTHER

-- Don't create swapfiles.
set_option("swapfile", false)

-- Don't create backups before overwriting files.
set_option("writebackup", false)

-- Use an undo file for persistent undos
set_option("undofile", true)

-- Automatically :write before running commands
set_option("autowrite", true)

-- Only join with one space after punctuation
set_option("joinspaces", false)

-- Turn off modelines
set_option("modeline", false)

-- Automatically read changes to files edited outside of Vim
set_option("autoread", true)

-- Ensure there's always a little space above and below the current line
set_option("scrolloff", 2)

-- Open horizontal splits below the current pane
set_option("splitbelow", true)

-- Open vertical splits to the right of the current pane
set_option("splitright", true)

-- Incrementally show effects of commands
set_option("inccommand", "nosplit")

-- Do not redraw the screen in the middle of a macro
set_option("lazyredraw", true)

-- Enable spell checking
set_option("spell", true)

-- NOTE: This has to be run with autocmd in order to override the ftplugins
-- l: Automatically wraps long lines in insert mode
-- t: Autowrap text using textwidth
-- r: Automatically continue comments when hitting enter

auto_command("BufNewFile,BufRead", "*", "setlocal formatoptions-=ltr")

-- Use Ripgrep in CtrlP for listing files.
set_variable('ctrlp_user_command', 'rg %s --files --color=never --hidden --glob "!.git/"')
set_variable('ctrlp_use_caching', 0)

-- Ripgrep is fast enough that CtrlP doesn't need to cache the files
set_variable('ctrlp_use_caching', 0)

-- Add wildcards for CtrlP and Vim to ignore
set_option("wildignore", vim.o.wildignore .. "*/tmp/*,*.zip,*/build/*,*.png,*.gif,*.jpg")

set_variable('ctrlp_custom_ignore', {
  file = '\\v\\.(zip,png,gif,jpg)$',
  dir = '\\v(build|tmp|log)'
})

-- Make opening a file in a new tab the default in CtrlP.
set_variable('ctrlp_prompt_mappings ', {
  ['AcceptSelection("e")'] = { '<c-t>' },
  ['AcceptSelection("t")'] = { '<cr>', '<2-LeftMouse>' }
})

-- Use the_silver_searcher over grep. I'm only setting this in case a plugin or an internal command
-- uses grep.
--
-- TODO: Replace this with Ripgrep
set_option("grepprg", "ag --nogroup --nocolor")

-- User the silver searcher for Ack.
--
-- TODO: Replace this with Ripgrep
set_variable('ackprg', 'ag --vimgrep')

-- Remove the delay when hitting the escape key
set_option("timeoutlen", 2000)
set_option("ttimeoutlen", 0)

-- Use regular line numbers in insert mode and relative numbers everywhere else
auto_command("InsertEnter", "*", ":set number norelativenumber")
auto_command("InsertLeave", "*", ":set relativenumber")

-- Wrap Git commit messages at 72 characters.
auto_command("FileType", "gitcommit", "set textwidth=72")

-- Use Deoplete.
vim.cmd("call deoplete#custom#option('auto_complete_delay', 0)")

-- Update the file types for the close tag plugin
set_variable('closetag_filenames', '*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs')

-- Prevent HTML tags from being expanded in HTML-esque files in delimitMate
auto_command(
  "FileType",
  "html,erb,jsx,jade,pug,hbs",
  "let b:delimitMate_matchpairs = '(:),{:},[:]'"
)

-- Configure netrw
set_variable('netrw_liststyle', 3)
set_variable('netrw_banner ', 0)

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
set_variable('argwrap_padded_braces', '[{')

-- Set comment configuration file formats
auto_command("BufNewFile,BufRead", ".babelrc", "set syntax=json")
auto_command("BufNewFile,BufRead", "Procfile", "set syntax=yaml")
auto_command("BufNewFile,BufRead", ".envrc", "set syntax=sh")

-- Automatically run checktime whenever the Neovim window gains focus. This should make the autoread
-- behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
auto_command("FocusGained", "*", ":checktime")

-- Configure SplitJoin
set_variable('splitjoin_ruby_hanging_args ', 0)
set_variable('splitjoin_html_attributes_bracket_on_new_line', 1)
set_variable('splitjoin_ruby_options_as_arguments', 1)

-- Automatically format files on save.
set_variable('ale_fixers', {
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
  ruby = { 'rubocop' }
})

-- Disable the TypeScript server in JavaScript files.
set_variable('ale_linters_ignore', {
  javascript = { 'tsserver' },
  javascriptreact = { 'tsserver' }
})

set_variable('ale_fix_on_save ', 1)

-- Required for operations modifying multiple buffers like rename.
set_option("hidden", true)

-- Configure the language servers
set_variable('LanguageClient_serverCommands', {
  javascript = { './node_modules/.bin/javascript-typescript-stdio' },
  javascriptreact = { './node_modules/.bin/javascript-typescript-stdio' },
  ruby = { 'bundle', 'exec', 'solargraph', 'stdio' }
})

-- Disable the language client's diagnostics
set_variable('LanguageClient_useVirtualText ', 'No')
set_variable('LanguageClient_diagnosticsEnable ', 0)

-- For some reason, ALE has recently become dependent on the completeopt setting, showing the
-- preview window whenever a word is tab completed. This setting turns off that behavior.
set_option("completeopt", "menu")
