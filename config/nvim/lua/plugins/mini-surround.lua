return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "ys",
      delete = "ds",
      find = "yf",
      find_left = "yF",
      highlight = "vs",
      replace = "cs",
      -- update_n_lines = "",
    },
    search_method = "cover_or_next",
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
