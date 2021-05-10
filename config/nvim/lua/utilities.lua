-- TODO: These commands should be replaced by the API commands when they're added.

local set_option = vim.api.nvim_set_option
local set_variable = vim.api.nvim_set_var

local function auto_command(event, pattern, command)
  vim.cmd("autocmd " .. event .. " " .. pattern .. " " .. command)
end

return { set_option = set_option, auto_command = auto_command, set_variable = set_variable }
