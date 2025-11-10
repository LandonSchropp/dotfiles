local M = {}

local tmux_display_message = function(format)
  if not vim.env.TMUX_PANE then
    return nil
  end

  return vim.trim(
    vim.fn.system("tmux display-message -pt '" .. vim.env.TMUX_PANE .. "' '" .. format .. "'")
  )
end

--- @return string|nil The name of the current tmux window, or nil if not in a tmux session.
function M.get_current_window()
  tmux_display_message("#{window_name}")
end

return M
