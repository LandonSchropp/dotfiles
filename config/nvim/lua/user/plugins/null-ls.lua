return function(config)
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

  return config
end
