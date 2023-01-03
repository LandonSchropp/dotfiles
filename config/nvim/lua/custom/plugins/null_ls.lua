return {
  after = "nvim-lspconfig",
  config = function()
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

    local sources = {

      -- Git
      null_ls.builtins.diagnostics.commitlint,
      null_ls.builtins.code_actions.gitrebase,
      null_ls.builtins.code_actions.gitsigns,

      -- JavaScript/TypeScript
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.deno_fmt,
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

      -- Nix
      null_ls.builtins.code_actions.statix,

      -- Spelling
      null_ls.builtins.completion.spell,

      -- Environment
      null_ls.builtins.diagnostics.dotenv_linter,

      -- Docker
      null_ls.builtins.diagnostics.hadolint,

      -- Markdown
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.write_good,

      -- Sass/Less/CSS
      null_ls.builtins.diagnostics.stylelint,

      -- HTML/XML
      null_ls.builtins.diagnostics.tidy,

      -- YAML
      null_ls.builtins.diagnostics.yamllint,

      -- Just
      null_ls.builtins.formatting.just,
    }

    -- Create the autocommand group for formatting.
    local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

    -- When called, attaches a callback to the provided buffer that formats it before saving.
    local on_attach = function(client, buffer_number)
      -- Don't bother registering the client unless it supports formatting.
      if not client.supports_method("textDocument/formatting") then
        return
      end

      -- Clear out any previous formatters.
      vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = buffer_number })

      -- Create an auto command to format the code when it's saved (before write).
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = formatting_group,
        buffer = buffer_number,
        callback = function()
          vim.lsp.buf.format({ buffer_number = buffer_number })
        end,
      })
    end

    -- Set up the null-ls plugin.
    null_ls.setup({
      sources = sources,
      on_attach = on_attach,
    })
  end,
}