return {
  "neovim/nvim-lspconfig",
  init = function()
    local keymap_utils = require("util.keymaps")
    local keymaps = require("lazyvim.plugins.lsp.keymaps").get()

    keymap_utils.remove(keymaps, "<c-k>")
    keymap_utils.remove(keymaps, "<leader>cf")

    keymap_utils.remap(keymaps, "<leader>cd", "gd")
    keymap_utils.remap(keymaps, "]d", "]]")
    keymap_utils.remap(keymaps, "[d", "[[")

    keymap_utils.remap_prefix(keymaps, "<leader>c", "<leader>l")
  end,
  opts = {
    format = {
      -- This is _required_ in order to get Rubocop formatting to work. Without it, the autoformat
      -- command fails silently.
      timeout_ms = 5000,
    },
    setup = {
      -- This rebinds the Typescript language server commands. Ideally, I wouldn't need to do this.
      -- https://github.com/LazyVim/LazyVim/issues/182
      tsserver = function(_, opts)
        require("lazyvim.util").on_attach(function(client, buffer)
          if client.name == "tsserver" then
            vim.keymap.set("n", "<leader>li", function()
              require("typescript").actions.addMissingImports()
            end, { desc = "Add missing imports", buffer = buffer })
            vim.keymap.set("n", "<leader>lo", function()
              require("typescript").actions.organizeImports()
            end, { desc = "Organize imports", buffer = buffer })
            vim.keymap.set("n", "<leader>lR", function()
              require("typescript").actions.rename()
            end, { desc = "Rename symbol", buffer = buffer })
          end
        end)

        -- Override the server options to disable the "File is a CommonJS module" error. This error
        -- is annoying because it's applied to configuration files that are required to be CommonJS
        -- modules.
        opts = vim.tbl_deep_extend("force", opts, {
          settings = {
            diagnostics = {
              ignoredCodes = { 80001 },
            },
          },
        })

        require("typescript").setup({
          server = opts,
        })

        return true
      end,
    },
  },
}
