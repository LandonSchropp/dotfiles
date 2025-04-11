local function extract_function()
  return require("refactoring").refactor("Extract Function")
end

local function extract_function_to_file()
  return require("refactoring").refactor("Extract Function To File")
end

local function extract_variable()
  return require("refactoring").refactor("Extract Variable")
end

local function inline_function()
  return require("refactoring").refactor("Inline Function")
end

local function inline_variable()
  return require("refactoring").refactor("Inline Variable")
end

local function extract_block()
  return require("refactoring").refactor("Extract Block")
end

local function extract_block_to_file()
  return require("refactoring").refactor("Extract Block To File")
end

local function select_refactor()
  require("refactoring").select_refactor()
end

return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {},
  keys = {
    {
      "<Leader>rf",
      extract_function,
      desc = "Extract function",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rF",
      extract_function_to_file,
      desc = "Extract function to file",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rv",
      extract_variable,
      desc = "Extract variable",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rI",
      inline_function,
      desc = "Inline function",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>ri",
      inline_variable,
      desc = "Inline variable",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rb",
      extract_block,
      desc = "Extract block",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rB",
      extract_block_to_file,
      desc = "Extract block to file",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<Leader>rr",
      select_refactor,
      desc = "Select refactor",
      mode = { "n", "x" },
      expr = true,
    },
  },
}
