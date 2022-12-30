-- Prevent Neovim's default ftplugins plugins from enabling keymaps for specific file types.
vim.api.nvim_set_var("no_plugin_maps", true)

return {
  general = {
    n = {
      -- Buffer commands.
      H = {"<cmd>bp<cr>", "Previous Buffer"},
      L = {"<cmd>bn<cr>", "Next Buffer"},

      -- Prevent the cursor from jumping when joining lines
      J = {"mzJ`z", "Join Lines"},

      -- Add mappings to jump between diagnostics.
      ["[["] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic"},
      ["]]"] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Next Diagnostic"},

      -- Create more convenient bindings for yanking to and pasting from the system clipboard.
      gy = {'"*y', "Yank to System Clipboard"},
      gp = {'"*p', "Paste From System Clipboard"},
      gY = {'"*y$', "Yank Until End of Line to System Clipboard"},

      -- Use escape to clear the highlights.
      ["<esc>"] = {":nohlsearch<cr>", "Clear Highlights"},

      -- Set up save and close buffer commands.
      W = {"<cmd>write<cr>", "Write Buffer"},
      X = {"<cmd>BufferKill<cr>", "Close Buffer"},
      Z = {"<cmd>write<bar>BufferKill<cr>", "Write and Close Buffer"},
    },

    v = {
      -- Create more convenient bindings for yanking to and pasting from the system clipboard.
      gy = {'"*y', "Yank to System Clipboard"},
      gp = {'"*p', "Paste From System Clipboard"},
    }
  },
}
