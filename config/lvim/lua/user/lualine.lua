local components = require("core.lualine.components")

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
