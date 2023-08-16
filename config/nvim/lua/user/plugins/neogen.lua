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
    { "<leader>ld", generate, desc = "Generate documentation" },
  },
}
