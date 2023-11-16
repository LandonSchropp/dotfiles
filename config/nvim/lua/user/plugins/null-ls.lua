local null_ls = require("null-ls")

local has_rubocop = function(util)
  return util.root_has_file(".rubocop.yml")
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local rubocop_options = {
      condition = has_rubocop,
      command = "bundle",
      extra_args = { "exec", "rubocop", "--server" },
      prepend_extra_args = true,
    }

    opts.sources = {

      -- Git
      null_ls.builtins.code_actions.gitrebase,
      null_ls.builtins.code_actions.gitsigns,

      -- JavaScript/TypeScript
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettier,

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
      null_ls.builtins.diagnostics.rubocop.with(rubocop_options),
      null_ls.builtins.formatting.rubocop.with(rubocop_options),
    }

    return opts
  end,
}
