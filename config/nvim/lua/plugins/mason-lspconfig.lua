---@module "lazy"

-- Install the Ruby language server.
---@type LazySpec
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "ruby_lsp" },
  },
}
