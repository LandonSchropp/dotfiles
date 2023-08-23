return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        -- always_show_bufferline = false,
      },
    },
  },
}
