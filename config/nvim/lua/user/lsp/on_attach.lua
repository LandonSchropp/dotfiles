return function(client, buffer)
  if client.name ~= "tsserver" then
    return
  end

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
