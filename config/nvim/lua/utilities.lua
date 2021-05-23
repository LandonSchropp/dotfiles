-- TODO: These commands should be replaced by the API commands when they're added.
-- TODO: The set_option variable isn't equivilent to VimL's set option. This should be updated to
-- use the new API when it's added. (https://github.com/neovim/neovim/pull/13479)

local set_option = vim.api.nvim_set_option
local set_variable = vim.api.nvim_set_var

local function auto_command(event, pattern, command)
  vim.cmd("autocmd " .. event .. " " .. pattern .. " " .. command)
end

return { set_option = set_option, auto_command = auto_command, set_variable = set_variable }
