local M = {}

-- Simple helper function that runs an auto command, excluding newlines.
-- TODO: This command should be replaced by the NeoVim API commands when an API is added.
function M.auto_command(command)
  vim.cmd("autocmd " .. string.gsub(command, "\n", ""))
end

local lua_auto_command_index = 1

-- This is a special implementation of auto_command that lets you use a Lua function as the
-- callback.
-- TODO: This command should be replaced by the NeoVim API commands when an API is added.
function M.lua_auto_command(event, pattern, callback)
  -- Store the callback function globally.
  _G.lua_auto_command_callbacks = _G.lua_auto_command_callbacks or {}
  _G.lua_auto_command_callbacks[lua_auto_command_index] = callback

  print("Storing command " .. lua_auto_command_index)

  -- Add the autocommand.
  M.auto_command(
    event
      .. " "
      .. pattern
      .. " lua _G.lua_auto_command_callbacks["
      .. lua_auto_command_index
      .. "]()"
  )

  -- Ensure the next function's index is incremented.
  lua_auto_command_index = lua_auto_command_index + 1
end

return M
