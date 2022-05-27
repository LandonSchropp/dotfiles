local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")
local null_ls = require("null-ls")
local filetype = require("filetype")

-- Extend the format on save timeout (it's taking quite a while for Rubocop.)
lvim.format_on_save.timeout = 10000

-- Manually register the Rubocop sources with null-ls to override the command to use bundle.
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/400#issuecomment-1004888014
for _, type in pairs({ "formatting", "diagnostics" }) do
  local source_config = null_ls.builtins[type].rubocop.with({
    command = "bundle",
    args = vim.list_extend(
      { "exec", "rubocop", "--disable-pending-cops" },
      null_ls.builtins[type].rubocop._opts.args
    ),
  })

  null_ls.register(source_config)
end

-- Formatters
formatters.setup({
  { name = "mix" },
  {
    name = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  { name = "fixjson" },
  { name = "stylua" },
})

-- Linters
linters.setup({
  {
    name = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  { name = "shellcheck" },
  { name = "markdownlint" },
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
  local buffer_filetype = vim.api.nvim_buf_get_option(buffer_number, "filetype")

  if buffer_filetype == "javascript" or buffer_filetype == "javascriptreact" then
    vim.diagnostic.disable(buffer_number, vim.lsp.diagnostic.get_namespace(client.id))
  end
end

-- Remove values from the LunarVim skipped servers.
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(value)
  return value ~= "tailwindcss"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Automatically set certain filetypes.
filetype.setup({
  overrides = {
    literal = {
      gitconfig = "gitconfig",
    },
  },
})
