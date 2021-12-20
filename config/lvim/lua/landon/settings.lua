local utilities = require("landon.utilities")
local auto_command = utilities.auto_command

-- The maximum width of the text being inserted
vim.opt.textwidth = 100

-- Wrap characters at the breakat point rather than the edge of the screen
vim.opt.linebreak = true

-- When text wraps, it should continue to be indented
vim.opt.breakindent = true

-- Highlight the line after the textwidth
vim.opt.colorcolumn = "+1"

-- SEARCH

-- Ignore case when searching
vim.opt.ignorecase = true

-- TABS

-- The number of spaces a tab counts for
vim.opt.tabstop = 2

-- The number of spaces to use for indentation step
vim.opt.shiftwidth = 2

-- Round to multiples of the shift width
vim.opt.shiftround = true

-- Use the correct number of spaces to insert a tab in insert mode
vim.opt.expandtab = true

-- Indent by two spaces when wrapping
vim.opt.breakindentopt = "shift:2"

-- OTHER

-- Use an undo file for persistent undos
vim.opt.undofile = true

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Only join with one space between words
vim.opt.joinspaces = false

-- Turn off modelines
vim.opt.modeline = false

-- Automatically read changes to files edited outside of Vim
vim.opt.autoread = true

-- Ensure there's always a little space above and below the current line
vim.opt.scrolloff = 2

-- Open horizontal splits below the current pane
vim.opt.splitbelow = true

-- Open vertical splits to the right of the current pane
vim.opt.splitright = true

-- Incrementally show effects of commands
vim.opt.inccommand = "nosplit"

-- Do not redraw the screen in the middle of a macro
vim.opt.lazyredraw = true

-- Enable spell checking
vim.opt.spell = true

-- NOTE: This has to be run with autocmd in order to override the ftplugins
-- l: Automatically wraps long lines in insert mode
-- t: Autowrap text using textwidth
-- r: Automatically continue comments when hitting enter
auto_command("BufNewFile,BufRead * setlocal formatoptions-=ltr")

-- Update the file types for the close tag plugin
vim.api.nvim_set_var("closetag_filenames", "*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs")

-- Set common configuration file formats
auto_command("BufNewFile,BufRead .babelrc set syntax=json")
auto_command("BufNewFile,BufRead Procfile set syntax=yaml")
auto_command("BufNewFile,BufRead .envrc set syntax=sh")

-- Automatically run checktime whenever the Neovim window gains focus. This should make the autoread
-- behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
auto_command("FocusGained * :checktime")

-- Configure SplitJoin
vim.api.nvim_set_var("splitjoin_ruby_hanging_args", 0)
vim.api.nvim_set_var("splitjoin_html_attributes_bracket_on_new_line", 1)
vim.api.nvim_set_var("splitjoin_ruby_options_as_arguments", 1)

-- Required for operations modifying multiple buffers like rename.
vim.opt.hidden = true

-- Configure LunarVim.
lvim.log.level = "warn"

-- Configure the LunarVim built-in plugins.
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- Install all of the maintained language parsers.
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true

-- Use a shorter header for the Dashboard so it doesn't take up the whole screen.
lvim.builtin.dashboard.custom_header = {
  "⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⣺⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⣿⠇⠀⠀⠀⠀⠀⣤⡄⠀⠀⢠⣤⡄⠀⢨⣭⣠⣤⣤⣤⡀⠀⠀⢀⣤⣤⣤⣤⡄⠀⠀⠀⣤⣄⣤⣤⣤⠀⠀⣿⣯⠀⠀⣿⡟⠀⠀⠀⣤⣤⣤⠀⠀⠀⠀⣠⣤⣤⣤⣄⣤⣤",
  "⢠⣿⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⣸⣿⠁⠀⣿⣿⠉⠀⠈⣿⡇⠀⠀⠛⠋⠀⠀⢹⣿⠀⠀⠀⣿⠏⠀⠸⠿⠃⠀⣿⣿⠀⣰⡟⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⡟⢸⣿⡇⢀⣿",
  "⣸⡇⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⣿⡟⠀⢠⣿⡇⠀⠀⢰⣿⡇⠀⣰⣾⠟⠛⠛⣻⡇⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⢻⣿⢰⣿⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⢸⣿⠇⢸⣿⠀⢸⡏",
  "⣿⣧⣤⣤⣤⡄⠀⠘⣿⣤⣤⡤⣿⠇⠀⢸⣿⠁⠀⠀⣼⣿⠀⠀⢿⣿⣤⣤⠔⣿⠃⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⠋⠀⠀⠀⢠⣤⣤⣿⣥⣤⡄⠀⣼⣿⠀⣸⡏⠀⣿⠃",
  "⠉⠉⠉⠉⠉⠁⠀⠀⠈⠉⠉⠀⠉⠀⠀⠈⠉⠀⠀⠀⠉⠉⠀⠀⠀⠉⠉⠁⠈⠉⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠉⠁⠀⠉⠁⠀⠉⠀",
}

-- Use a longer time out length so vim-surround keyboard shortcuts have time to complete.
vim.opt.timeoutlen = 500

-- Dont use the system clipboard.
vim.opt.clipboard = {}

-- Configure Trouble.
lvim.lsp.diagnostics.virtual_text = false

-- Only use one line for commands.
vim.opt.cmdheight = 1

-- Disable project.nvim. (It doesn't work as well as vim-rooter.)
lvim.builtin.project.active = false

-- Display hidden files in the file picker.
lvim.builtin.telescope.pickers = { find_files = { hidden = true } }

-- Improve the Telescope display.
lvim.builtin.telescope.defaults.layout_config.width = 0.999999
lvim.builtin.telescope.defaults.path_display = { "smart" }
