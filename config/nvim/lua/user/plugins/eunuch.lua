-- Quickly run Unix commands.
return {
  "tpope/vim-eunuch",
  init = function()
    -- A helper function that makes aliasing Eunuch commands quick.
    local function alias_command(alias, command)
      vim.cmd(
        "cabbrev "
          .. alias
          .. ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "'
          .. command
          .. '" : "'
          .. alias
          .. '"<cr>'
      )
    end

    -- Alias the Eunuch commands (expect for Move and Wall)
    alias_command("remove", "Delete")
    alias_command("delete", "Delete")
    alias_command("unlink", "Unlink")
    alias_command("rename", "Rename")
    alias_command("chmod", "Chmod")
    alias_command("mkdir", "Mkdir")
    alias_command("find", "Find")
    alias_command("locate", "Locate")
    alias_command("sudowrite", "Sudowrite")
    alias_command("sudoedit", "Sudoedit")
  end,
}
