-- Start Neovim's RPC server on a socket for MCP server integration, but only if we're running
-- in the main tmux pane (in a window named "neovim").

local function get_tmux_window_name()
  if not vim.env.TMUX_PANE then
    return nil
  end

  return vim.trim(
    vim.fn.system("tmux display-message -pt '" .. vim.env.TMUX_PANE .. "' '#{window_name}'")
  )
end

local function should_start_socket()
  return vim.tbl_contains({ "neovim", "vim" }, get_tmux_window_name())
end

if not should_start_socket() then
  return
end

local socket_dir = vim.fn.getcwd() .. "/.agents"
local socket_path = socket_dir .. "/neovim.sock"

-- Create the directory if it doesn't exist
if vim.fn.isdirectory(socket_dir) == 0 then
  vim.fn.mkdir(socket_dir, "p")
end

-- Remove any existing socket file (could be stale from a crash)
if vim.fn.filereadable(socket_path) == 1 then
  vim.fn.delete(socket_path)
end

-- Start the RPC server
if vim.fn.serverstart(socket_path) == nil then
  vim.notify("Failed to start Neovim RPC server at " .. socket_path, vim.log.levels.WARN)
end
