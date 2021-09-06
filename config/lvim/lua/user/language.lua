-- For a list of all available formatters and linters, look here:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#available-sources

-- Enable formatting.
lvim.format_on_save = true

-- Enable the formatters.
lvim.lang.elixir.formatters = { { exe = "mix" } }
lvim.lang.javascript.formatters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.formatters = { { exe = "eslint_d" } }
lvim.lang.json.formatters = { { exe = "fixjson" } }
lvim.lang.lua.formatters = { { exe = "stylua" } }
-- TODO: Enable this formatter.
-- lvim.lang.markdown.formatters = { { exe = "write_good" }, { exe = "markdownlint" } }
lvim.lang.ruby.formatters = { { exe = "rubocop" } }

-- Enable the linters.
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.linters = { { exe = "eslint_d" } }
lvim.lang.ruby.linters = { { exe = "rubocop" } }
lvim.lang.sh.linters = { { exe = "shellcheck" } }
