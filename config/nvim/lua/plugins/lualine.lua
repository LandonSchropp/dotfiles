---@module "lazy"

-- Formats a fraction so the numerator and denominator have the same number of digits.
local function format_fraction(numerator, denominator)
  local number_of_digits = string.len(tostring(denominator))
  local formatted_numerator = string.format("%0" .. number_of_digits .. "d", numerator)
  return formatted_numerator .. "/" .. denominator
end

local function location()
  local current_line = vim.fn.line(".")
  local number_of_lines = vim.fn.line("$")
  return format_fraction(current_line, number_of_lines)
end

local function format_search_count(search_count)
  return search_count:gsub("[[%]]", "")
end

local function recording()
  if vim.fn.reg_recording() == "" then
    return ""
  end

  return "recording " .. vim.fn.reg_recording()
end

-- A nicer status line.
---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = "%#LineNr#|",
        disabled_filetypes = {
          "snacks_dashboard",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", color = {}, cond = nil, left = 0, right = 0, file_status = false },
          { "filetype", left = 0,   right = 0 },
        },
        lualine_x = {
          { recording, icon = "", color = "Constant" },
          { "searchcount", icon = "", color = "Function", fmt = format_search_count },
          { "diff" },
        },
        lualine_y = { "diagnostics" },
        lualine_z = { { location, icon = "" } },
      },
    },
  },
}
