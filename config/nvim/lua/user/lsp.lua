return {
  -- Skip the tsserver setup so typescript.nvim can do it instead (per the AstroNvim instructions).
  -- https://astronvim.github.io/Recipes/advanced_lsp#typescript-typescriptnvim
  skip_setup = { "tsserver" },
}
