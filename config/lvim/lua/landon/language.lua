local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")
local null_ls = require("null-ls")
local filetype = require("filetype")
local lsp_utils = require("lspconfig")["util"]

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
    cwd = function(params)
      return lsp_utils.root_pattern(".rubocop.yml", ".git")(params.bufname)
    end,
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

-- Remove values from the LunarVim skipped servers.
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(value)
  return value ~= "tailwindcss"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Automatically set certain filetypes.
filetype.setup({
  overrides = {
    literal = {
      gitconfig = "gitconfig",
      Guardfile = "ruby",
      zprofile = "zsh",
    },
  },
})
