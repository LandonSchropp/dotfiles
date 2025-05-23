---@module "lazy"

---@type LazySpec
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
    check_syntax_error = false,
  },
  keys = {
    {
      "gj",
      function()
        require("treesj").join()
      end,
      desc = "Join",
    },
    {
      "gJ",
      function()
        require("treesj").join({ join = { recursive = true } })
      end,
      desc = "Join recursively",
    },
    {
      "gs",
      function()
        require("treesj").split()
      end,
      desc = "Split",
    },
    {
      "gS",
      function()
        require("treesj").split({ split = { recursive = false } })
      end,
      desc = "Split recursively",
    },
  },
}
