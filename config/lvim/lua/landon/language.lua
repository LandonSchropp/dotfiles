local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")

-- Formatters
formatters.setup({
  { exe = "mix" },
  { exe = "eslint_d" },
  { exe = "fixjson" },
  { exe = "stylua" },
})

-- Linters
linters.setup({
  { exe = "eslint_d" },
  { exe = "rubocop" },
  { exe = "shellcheck" },
  { exe = "markdownlint" },
  { exe = "write_good" },
})
