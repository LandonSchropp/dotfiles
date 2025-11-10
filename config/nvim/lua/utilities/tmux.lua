local M = {}

--- Run a tmux command.
--- @param cmd string The tmux command to run (not including tmux).
--- @return string The trimmed output of the command.
local function run_tmux_command(cmd)
  return vim.trim(vim.fn.system("tmux " .. cmd))
end

--- Helper function to run `tmux display-message` command.
--- @param format string The format string to pass to tmux.
--- @return string|nil The output of the command, or nil if not in a tmux session.
local tmux_display_message = function(format)
  local tmux_pane = vim.env.TMUX_PANE

  if not tmux_pane then
    return nil
  end

  return run_tmux_command("display-message -pt " .. tmux_pane .. " '" .. format .. "'")
end

--- @return string|nil The name of the current tmux session, or nil if not in a tmux session.
function M.get_current_session()
  return tmux_display_message("#{session_name}")
end

--- @return string|nil The name of the current tmux window, or nil if not in a tmux session.
function M.get_current_window()
  return tmux_display_message("#{window_name}")
end

--- Check if a window exists in a tmux session.
--- @param session string The name of the tmux session.
--- @param window string The name of the tmux window.
--- @return boolean True if the window exists, false otherwise.
function M.window_exists(session, window)
  local windows = run_tmux_command("list-windows -t " .. session .. " -F '#{window_name}'")
  return vim.tbl_contains(vim.split(windows, "\n"), window)
end

--- Sends text to a specific tmux window in a specific session.
--- @param session string The name of the tmux session.
--- @param window string The name of the tmux window.
--- @param text string The text to send to the tmux window.
function M.send_text_to_window(session, window, text)
  run_tmux_command("send-keys -t " .. session .. ":" .. window .. " " .. vim.fn.shellescape(text))
end

return M
