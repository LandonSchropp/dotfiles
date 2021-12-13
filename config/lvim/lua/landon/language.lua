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

-- Configure the ts-utils to use the TypeScript language server client.
lvim.lsp.on_attach_callback = function(client)
  if client.name ~= "tsserver" then
    return
  end

  local ts_utils = require("nvim-lsp-ts-utils")

  ts_utils.setup({
    auto_inlay_hints = false,
    update_imports_on_move = true,
  })

  ts_utils.setup_client(client)
end
