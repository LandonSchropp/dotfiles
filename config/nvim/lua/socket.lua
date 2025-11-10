-- Start Neovim's RPC server on a socket for MCP server integration, but only if we're running
-- in the main tmux pane (in a window named "neovim").

local tmux = require("utilities/tmux")

-- Only start the server if we're in a tmux session and in the "neovim" or "vim" window.
if not vim.tbl_contains({ "neovim", "vim" }, tmux.get_current_window()) then
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
