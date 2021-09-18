-- FIX: Remove this after this issue is fixed: https://github.com/LunarVim/LunarVim/issues/1554.
lvim.lang.markdown = {}

-- Formatters
lvim.lang.elixir.formatters = { { exe = "mix" } }
lvim.lang.javascript.formatters = { { exe = "eslint_d" } }
lvim.lang.json.formatters = { { exe = "fixjson" } }
lvim.lang.lua.formatters = { { exe = "stylua" } }

-- Linters
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.ruby.linters = { { exe = "rubocop" } }
lvim.lang.sh.linters = { { exe = "shellcheck" } }
lvim.lang.markdown.linters = { { exe = "markdownlint" }, { exe = "write_good" } }
