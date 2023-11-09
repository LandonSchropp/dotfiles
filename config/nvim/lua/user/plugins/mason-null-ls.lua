-- This plugin has been causing me headaches in how it configures the language servers. I only use a
-- few language servers, so the rest seem redundant, and I don't usually want them to auto start.
return {
  "jay-babu/mason-null-ls.nvim",
  enabled = false,
}
