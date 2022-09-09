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

-- Override LunarVim's formatting options.
lvim.autocommands._formatoptions = {}

-- Configure the auto-formatting options while writing code.
vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = {
      ["1"] = false, -- It's okay to break lines after a one-letter words.
      ["2"] = true, -- Use the indent value from 2nd line of a paragraph, not the first.
      q = true, -- Continue comments when using gq.
      c = true, -- Auto-wrap comments using textwidth.
      r = true, -- Automatically continue comments when pressing enter.
      n = true, -- Recognize numbered lists
      t = false, -- Don't wrap text using textwidth. (I prefer to do this manually.)
      j = true, -- Remove comment leaders when joining lines.
      l = true, -- Don't break long lines in insert mode.
      v = false, -- Don't auto-wrap lines in insert mode.
      a = false, -- Don't automatically format paragraphs
    }
  end,
  desc = "Automatically format text.",
})

-- Update the file types for the close tag plugin
vim.api.nvim_set_var("closetag_filenames", "*.html,*.erb,*.jade,*.pug,*.jsx,*.njk,*.hbs")

-- Set common configuration file formats
local filetype_overrides = {
  [".babelrc"] = "json",
  Procfile = "json",
  [".envrc"] = "sh",
}

for file_name, file_type in pairs(filetype_overrides) do
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = file_name,
    callback = function(args)
      vim.api.nvim_buf_set_option(args.buf, "filetype", file_type)
    end,
  })
end

-- Automatically run checktime whenever the Neovim window gains focus. This should make the autoread
-- behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = function()
    vim.api.nvim_command("checktime")
  end,
})

-- Configure SplitJoin
vim.api.nvim_set_var("splitjoin_ruby_hanging_args", 0)
vim.api.nvim_set_var("splitjoin_html_attributes_bracket_on_new_line", 1)
vim.api.nvim_set_var("splitjoin_ruby_options_as_arguments", 1)

-- Required for operations modifying multiple buffers like rename.
vim.opt.hidden = true

-- Configure LunarVim.
lvim.log.level = "warn"

-- Configure the LunarVim built-in plugins.
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"

-- Install all of the language parsers.
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true

-- Use a shorter header for the dashboard so it doesn't take up the whole screen.
lvim.builtin.alpha.dashboard.section.header.val = {
  "⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⣺⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⣿⠇⠀⠀⠀⠀⠀⣤⡄⠀⠀⢠⣤⡄⠀⢨⣭⣠⣤⣤⣤⡀⠀⠀⢀⣤⣤⣤⣤⡄⠀⠀⠀⣤⣄⣤⣤⣤⠀⠀⣿⣯⠀⠀⣿⡟⠀⠀⠀⣤⣤⣤⠀⠀⠀⠀⣠⣤⣤⣤⣄⣤⣤",
  "⢠⣿⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⣸⣿⠁⠀⣿⣿⠉⠀⠈⣿⡇⠀⠀⠛⠋⠀⠀⢹⣿⠀⠀⠀⣿⠏⠀⠸⠿⠃⠀⣿⣿⠀⣰⡟⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⡟⢸⣿⡇⢀⣿",
  "⣸⡇⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⣿⡟⠀⢠⣿⡇⠀⠀⢰⣿⡇⠀⣰⣾⠟⠛⠛⣻⡇⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⢻⣿⢰⣿⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⢸⣿⠇⢸⣿⠀⢸⡏",
  "⣿⣧⣤⣤⣤⡄⠀⠘⣿⣤⣤⡤⣿⠇⠀⢸⣿⠁⠀⠀⣼⣿⠀⠀⢿⣿⣤⣤⠔⣿⠃⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⠋⠀⠀⠀⢠⣤⣤⣿⣥⣤⡄⠀⣼⣿⠀⣸⡏⠀⣿⠃",
  "⠉⠉⠉⠉⠉⠁⠀⠀⠈⠉⠉⠀⠉⠀⠀⠈⠉⠀⠀⠀⠉⠉⠀⠀⠀⠉⠉⠁⠈⠉⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠉⠁⠀⠉⠁⠀⠉⠀",
}

-- Customize the dashboard buttons.
lvim.builtin.alpha.dashboard.section.buttons = {
  entries = {
    { "<leader>f", "  Find File", "<CMD>Telescope find_files<CR>" },
    { "<leader>F", "  Find Text", "<CMD>Telescope live_grep<CR>" },
    { "<leader>n", "  New File", "<CMD>ene!<CR>" },
  },
}

-- Remove the branch SHA from the dashboard footer.
table.remove(lvim.builtin.alpha.dashboard.section.footer.val)

-- Use a longer time out length so vim-surround keyboard shortcuts have time to complete.
vim.opt.timeoutlen = 500

-- Dont use the system clipboard.
vim.opt.clipboard = {}

-- Configure Trouble.
lvim.lsp.diagnostics.virtual_text = false

-- Only use one line for commands.
vim.opt.cmdheight = 1

-- Configure project.nvim so it doesn't change to subdirectories in monorepos.
table.insert(lvim.builtin.project.detection_methods, 0, "!>packages")
table.insert(lvim.builtin.project.detection_methods, 0, "!>plugins")

-- Display hidden files in the file picker.
lvim.builtin.telescope.pickers = { find_files = { hidden = true } }

-- Improve the Telescope display.
lvim.builtin.telescope.defaults.layout_config.width = 0.999999
lvim.builtin.telescope.defaults.path_display = { "smart" }
