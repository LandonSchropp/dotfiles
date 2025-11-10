local tmux = require("utilities/tmux")

local function send_to_claude_code(text)
  -- Get session info
  local session = tmux.get_current_session()

  if not session then
    vim.notify("You're not in a tmux session!", vim.log.levels.WARN)
    return
  end

  -- Check if claude window exists
  if not tmux.window_exists(session, "claude") then
    vim.notify(
      "A 'claude' window was not found in the '" .. session .. "' session.",
      vim.log.levels.WARN
    )
    return
  end

  -- Send the text to Claude Code
  tmux.send_text_to_window(session, "claude", text)
  vim.notify("Sent the reference to Claude Code.", vim.log.levels.INFO)
end

-- Generate reference string for a file with optional line numbers
-- @param path string: The file path
-- @param start_line number|nil: The starting line number (optional)
-- @param end_line number|nil: The ending line number (optional)
-- @return string: The formatted reference string
local function generate_reference(path, start_line, end_line)
  end_line = end_line or start_line
  local relative_path = vim.fn.fnamemodify(path, ":.")

  if not start_line and not end_line then
    return "@" .. relative_path
  end

  if start_line == end_line then
    return "@" .. relative_path .. "#L" .. start_line
  end

  return "@" .. relative_path .. "#L" .. start_line .. "-" .. end_line
end

local function reference_file()
  send_to_claude_code(generate_reference(vim.fn.expand("%:p")))
end

local function reference_line()
  local filepath = vim.fn.expand("%:p")
  local line_num = vim.fn.line(".")
  send_to_claude_code(generate_reference(filepath, line_num))
end

local function reference_selection()
  local filepath = vim.fn.expand("%:p")
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  -- Ensure start_line is always less than end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  send_to_claude_code(generate_reference(filepath, start_line, end_line))
end

return function(_)
  return {
    n = {
      ["<Leader>aR"] = { reference_file, desc = "Reference file" },
      ["<Leader>ar"] = { reference_line, desc = "Reference current line" },
    },
    v = {
      ["<Leader>ar"] = { reference_selection, desc = "Reference selection" },
    },
  }
end
