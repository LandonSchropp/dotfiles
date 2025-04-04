local function substitute_operator()
  require("substitute").operator()
end

local function substitute_line()
  require("substitute").line()
end

local function substitute_visual()
  require("substitute").visual()
end

return {
  "gbprod/substitute.nvim",
  keys = {
    { "S",  substitute_operator, mode = "n", desc = "Substitute",      noremap = true },
    { "SS", substitute_line,     mode = "n", desc = "Substitute line", noremap = true },
    { "S",  substitute_visual,   mode = "x", desc = "Substitute",      noremap = true },
  },
  config = true,
}
