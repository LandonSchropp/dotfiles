local components = require("core.lualine.components")
local utilities = require("user.utilities")
local auto_command = utilities.auto_command
local actions = require("telescope.actions")

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

-- Use relative line numbers
vim.opt.relativenumber = true

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

-- Use regular line numbers in insert mode and relative numbers everywhere else
auto_command("InsertEnter * :set number norelativenumber")
auto_command("InsertLeave * :set relativenumber")

-- Update the file types for the close tag plugin
vim.api.nvim_set_var("closetag_filenames", "*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs")

-- Prevent HTML tags from being expanded in HTML-esque files in delimitMate
auto_command("FileType html,erb,jsx,jade,pug,hbs let b:delimitMate_matchpairs = '(:),{:},[:]'")

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

-- Configure the status line.
-- TODO: Enable the curved separator characters once the following bug is fixed:
-- https://github.com/ryanoasis/nerd-fonts/issues/661
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.options.section_separators = { "", "" }
lvim.builtin.lualine.options.component_separators = { "", "" }
-- lvim.builtin.lualine.options.section_separators = {"", ""}
-- lvim.builtin.lualine.options.component_separators = {"", ""}

local function location()
  return vim.fn.line(".") .. "/" .. vim.fn.line("$")
end

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.branch }
lvim.builtin.lualine.sections.lualine_c = { components.filename }
lvim.builtin.lualine.sections.lualine_x = {
  components.diagnostics,
  components.diff,
  separator = " ",
}
lvim.builtin.lualine.sections.lualine_y = { components.filetype }
lvim.builtin.lualine.sections.lualine_z = { location }

-- Configure Telescope.
lvim.builtin.telescope.defaults.mappings.i["<esc>"] = actions.close
