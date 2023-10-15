return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    local has_rubocop = function(util)
      return util.root_has_file(".rubocop.yml")
    end

    opts.handlers.rubocop = function()
      local null_ls = require("null-ls")

      local options = {
        condition = has_rubocop,
        command = "bundle",
        extra_args = { "exec", "rubocop", "--server" },
        prepend_extra_args = true,
      }

      null_ls.register(null_ls.builtins.diagnostics.rubocop.with(options))
      null_ls.register(null_ls.builtins.formatting.rubocop.with(options))
    end
  end,
}
