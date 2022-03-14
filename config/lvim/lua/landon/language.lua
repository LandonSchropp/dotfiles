local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")

-- Formatters
formatters.setup({
  { exe = "mix" },
  {
    exe = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  { exe = "fixjson" },
  { exe = "rubocop" },
  { exe = "stylua" },
})

-- Linters
linters.setup({
  {
    exe = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  { exe = "rubocop" },
  { exe = "shellcheck" },
  { exe = "markdownlint" },
})

lvim.lsp.on_attach_callback = function(client, buffer_number)
  -- Only add specific configuration for TypeScript.
  if client.name ~= "tsserver" then
    return
  end

  -- Configure the ts-utils to use the TypeScript language server client.
  local ts_utils = require("nvim-lsp-ts-utils")

  ts_utils.setup({
    auto_inlay_hints = false,
    update_imports_on_move = true,
  })

  ts_utils.setup_client(client)

  -- HACK: TypeScript diagnostics are required in order to enable ts-util's import functions.
  -- However, these diagnostics also
  local filetype = vim.api.nvim_buf_get_option(buffer_number, "filetype")

  if filetype == "javascript" or filetype == "javascriptreact" then
    vim.diagnostic.disable(buffer_number, vim.lsp.diagnostic.get_namespace(client.id))
  end
end
