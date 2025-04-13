---@module "lazy"

---@type LazySpec
return {
  "folke/tokyonight.nvim",
  opts = {
    on_colors = function(colors)
      colors.border = colors.dark3
    end,
  },
}
