-- TODO: This command should be replaced by the API commands when an API is added.
local function auto_command(event, pattern, command)
  vim.cmd("autocmd " .. event .. " " .. pattern .. " " .. command)
end

return { auto_command = auto_command }
