local function location()
  local line = vim.fn.line(".")
  local number_of_lines = vim.fn.line("$")
  local formatted_line = string.format("%0" .. string.len(tostring(number_of_lines)) .. "d", line)
  return " " .. formatted_line .. "/" .. number_of_lines
end

-- A nicer status line.
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- TODO: Enable the curved separator characters ("" and "") once the following bug is fixed:
        -- https://github.com/ryanoasis/nerd-fonts/issues/661
        section_separators = { left = "", right = "" },
        component_separators = "|",
        disabled_filetypes = {
          "alpha",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", color = {}, cond = nil, left = 0, right = 0, file_status = false },
          { "filetype", left = 0,   right = 0 },
        },

        lualine_x = { "diff" },
        lualine_y = { "diagnostics" },
        lualine_z = { location },
      },
    },
  },
}
