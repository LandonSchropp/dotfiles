local null_ls = require("null-ls")

-- Formatters
lvim.lang.lua.formatters = { { exe = "stylua" } }
lvim.lang.json.formatters = { { exe = "fixjson" } }
lvim.lang.elixir.formatters = { { exe = "mix" } }
lvim.lang.javascript.formatters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.formatters = { { exe = "eslint_d" } }

-- Linters
lvim.lang.ruby.linters = { { exe = "rubocop" } }
lvim.lang.sh.linters = { { exe = "rubocop" } }
-- lvim.lang.markdown.linters = { { exe = "markdownlint" }, { exe = "write_good" } }
