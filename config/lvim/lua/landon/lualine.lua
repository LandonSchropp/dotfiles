local components = require("lvim.core.lualine.components")

-- Configure the status line.
-- TODO: Enable the curved separator characters once the following bug is fixed:
-- https://github.com/ryanoasis/nerd-fonts/issues/661
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
-- lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = "|"

local function location()
  line = vim.fn.line(".")
  number_of_lines = vim.fn.line("$")
  line = string.format("%0" .. string.len(tostring(number_of_lines)) .. "d", line)
  return " " .. line .. "/" .. number_of_lines
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
