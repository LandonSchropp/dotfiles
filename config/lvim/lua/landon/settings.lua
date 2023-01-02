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

-- Configure project.nvim so it doesn't change to subdirectories in monorepos.
table.insert(lvim.builtin.project.detection_methods, 0, "!>packages")
table.insert(lvim.builtin.project.detection_methods, 0, "!>plugins")

local telescope = require("telescope")

-- Improve the Telescope display.
lvim.builtin.telescope.defaults.layout_config.width = 0.999999
lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- Improve the Telescope sorting algorithm.
telescope.load_extension("fzf")
