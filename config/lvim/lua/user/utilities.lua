-- Simple helper function that runs an auto command, excluding newlines.
-- TODO: This command should be replaced by the NeoVim API commands when an API is added.
local function auto_command(command)
  vim.cmd("autocmd " .. string.gsub(command, "\n", " "))
end

return { auto_command = auto_command }
