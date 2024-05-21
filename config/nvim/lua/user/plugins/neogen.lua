local function generate()
  require("neogen").generate({})
end

return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    snippet_engine = "luasnip",
  },
  version = "*",
  keys = {
    { "<Leader>ld", generate, desc = "Generate documentation" },
  },
}
