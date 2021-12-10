local components = require("lvim.core.lualine.components")

-- Configure the status line.
-- TODO: Enable the curved separator characters once the following bug is fixed:
-- https://github.com/ryanoasis/nerd-fonts/issues/661
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.options.section_separators = { "", "" }
lvim.builtin.lualine.options.section_separators = { "a", "b" }
lvim.builtin.lualine.options.component_separators = { "", "" }
-- lvim.builtin.lualine.options.section_separators = {"", ""}
-- lvim.builtin.lualine.options.component_separators = {"", ""}

local function location()
  return vim.fn.line(".") .. "/" .. vim.fn.line("$")
end

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.branch }
lvim.builtin.lualine.sections.lualine_c = {
  { "filename", color = {}, cond = nil, left = 0, right = 0 },
  { "filetype", left = 0, right = 0 },
}


-- TODO: For some reason, this causes the LunarVim status page to load with line numbers 50% of the
-- time when the separator option is used.
lvim.builtin.lualine.sections.lualine_x = { components.diagnostics }
lvim.builtin.lualine.sections.lualine_y = { components.diff }
lvim.builtin.lualine.sections.lualine_z = { location }
