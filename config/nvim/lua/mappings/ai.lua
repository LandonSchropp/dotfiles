local tmux = require("utilities/tmux")
local snacks = require("snacks")

--- Send the text to the "claude" tmux window in the current session.
--- @param text string The text to send.
local function send_to_claude_code(text)
  local session = tmux.get_current_session()

  if not session then
    vim.notify("You're not in a tmux session!", vim.log.levels.WARN)
    return
  end

  if not tmux.window_exists(session, "claude") then
    vim.notify(
      "A 'claude' window was not found in the '" .. session .. "' session.",
      vim.log.levels.WARN
    )
    return
  end

  tmux.send_text_to_window(session, "claude", text)
end

--- Send a reference string to the "claude" tmux window.
--- @param reference string The reference string to send.
local function send_reference_to_claude_code(reference)
  send_to_claude_code(reference)
  vim.notify("Sent the reference to Claude Code.", vim.log.levels.INFO)
end

--- Prompt the user for input and send it along with a reference to the "claude" tmux window.
--- @param reference string The reference string to send along with the prompt.
local function send_prompt_to_claude_code(reference)
  snacks.input({
    prompt = "Your prompt:",
    win = {
      width = 80,
      max_width = 80,
    },
  }, function(value)
    if value then
      send_to_claude_code(reference .. "\n\n" .. value)
      tmux.send_return_to_window(tmux.get_current_session(), "claude")
      vim.notify("Sent the prompt to Claude Code.", vim.log.levels.INFO)
    end
  end)
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

--- @return string The reference for the current file.
local function current_file_reference()
  return generate_reference(vim.fn.expand("%:p"))
end

--- @return string The reference for the current line.
local function current_line_reference()
  return generate_reference(vim.fn.expand("%:p"), vim.fn.line("."))
end

--- @return string The reference for the current visual selection.
local function current_selection_reference()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  -- Ensure start_line is always less than end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  return generate_reference(vim.fn.expand("%:p"), start_line, end_line)
end

return function(_)
  return {
    n = {
      ["<Leader>aR"] = {
        function()
          send_reference_to_claude_code(current_file_reference())
        end,
        desc = "Reference file",
      },
      ["<Leader>ar"] = {
        function()
          send_reference_to_claude_code(current_line_reference())
        end,
        desc = "Reference current line",
      },
      ["<Leader>aP"] = {
        function()
          send_prompt_to_claude_code(current_file_reference())
        end,
        desc = "Prompt with file",
      },
      ["<Leader>ap"] = {
        function()
          send_prompt_to_claude_code(current_line_reference())
        end,
        desc = "Prompt with current line",
      },
    },
    v = {
      ["<Leader>ar"] = {
        function()
          send_reference_to_claude_code(current_selection_reference())
        end,
        desc = "Reference selection",
      },
      ["<Leader>ap"] = {
        function()
          send_prompt_to_claude_code(current_selection_reference())
        end,
        desc = "Prompt with selection",
      },
    },
  }
end
