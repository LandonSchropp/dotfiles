local null_ls = require("null-ls")

-- For a list of all available formatters and linters, look here:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#available-sources

-- Enable formatting.
lvim.format_on_save = true

local sources = {

  -- Formatters
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.fixjson,
  null_ls.builtins.formatting.mix,
  null_ls.builtins.formatting.stylua,

  -- Linters
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.write_good,
}

-- Enable the formatters and linters.
null_ls.register({ sources = sources })
