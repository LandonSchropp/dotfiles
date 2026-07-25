-- Start Neovim's RPC server on a socket for MCP server integration, but only if we're running
-- in a herdr workspace's main Neovim tab.

local herdr = require("utilities/herdr")

-- Only start the server if we're in a Herdr workspace and in a Neovim tab.
if not vim.tbl_contains({ "neovim", "nvim", "vim" }, herdr.get_current_tab()) then
  return
end

-- Determine the socket path
local socket_directory = vim.fn.getcwd() .. "/.agents"
local socket_path = socket_directory .. "/neovim.sock"

-- Create the directory if it doesn't exist
if vim.fn.isdirectory(socket_directory) == 0 then
  vim.fn.mkdir(socket_directory, "p")
end

-- Remove any existing socket file (could be stale from a crash)
if vim.fn.filereadable(socket_path) == 1 then
  vim.fn.delete(socket_path)
end

-- Start the RPC server
if vim.fn.serverstart(socket_path) == nil then
  vim.notify("Failed to start Neovim RPC server at " .. socket_path, vim.log.levels.WARN)
end
