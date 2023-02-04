return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")
    local lsp_utils = require("lspconfig")["util"]

    -- Manually register the Rubocop sources with null-ls to use bundler.
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
      },
    }
  end,
}
