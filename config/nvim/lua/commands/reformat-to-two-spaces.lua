return {
  function()
    -- Set the indentation options for the current buffer
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2

    -- Replace existing tabs with spaces
    vim.cmd("retab")

    -- Reindent the entire buffer
    vim.cmd("normal! gg=G")
  end,
  desc = "Reformats the current buffer to use two spaces for indentation.",
}
