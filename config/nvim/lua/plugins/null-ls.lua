local RUBOCOP_OPTIONS = { prefer_local = "bin", timeout = 5000 }

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")
    local lsp_utils = require("lspconfig")["util"]

    return {
      sources = {

        -- Git
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns,

        -- JavaScript/TypeScript
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,

        -- JSON
        null_ls.builtins.formatting.fixjson,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Elixir
        null_ls.builtins.formatting.mix,

        -- Shell
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.zsh,

        -- Docker
        null_ls.builtins.diagnostics.hadolint,

        -- HTML/XML
        null_ls.builtins.diagnostics.tidy,

        -- Just
        null_ls.builtins.formatting.just,

        -- Ruby
        null_ls.builtins.diagnostics.rubocop.with(RUBOCOP_OPTIONS),
        null_ls.builtins.formatting.rubocop.with(RUBOCOP_OPTIONS),
      },
    }
  end,
}
