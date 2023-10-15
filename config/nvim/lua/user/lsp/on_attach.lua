return function(client, buffer)
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>li", function()
      require("typescript").actions.addMissingImports()
    end, { desc = "Add missing imports", buffer = buffer })

    vim.keymap.set("n", "<leader>lo", function()
      require("typescript").actions.organizeImports()
    end, { desc = "Organize imports", buffer = buffer })

    vim.keymap.set("n", "<leader>lF", function()
      require("typescript").actions.fixAll()
    end, { desc = "Fix all", buffer = buffer })

    vim.keymap.set("n", "<leader>lu", function()
      require("typescript").actions.removeUnused()
    end, { desc = "Remove unused", buffer = buffer })
  end

  -- TODO: This can be removed once this is added to AstronvimCommunity.
  -- https://github.com/AstroNvim/astrocommunity/issues/608
  if client.name == "eslint" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buffer,
      command = "EslintFixAll",
    })
  end
end
