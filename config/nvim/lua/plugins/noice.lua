---@module "lazy"

---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      -- Language servers report progress on every save, which floods the corner with popups.
      progress = { enabled = false },
    },
  },
}
