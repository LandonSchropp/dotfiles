require("typescript").setup({
  -- Configure the TypeScript server according to the AstroNvim instructions.
  -- https://astronvim.github.io/Recipes/advanced_lsp#typescript-typescriptnvim
  server = astronvim.lsp.server_settings("tsserver"),
})
