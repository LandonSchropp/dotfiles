local M = {}

-- Closes all of the buffers except the current one. This is used over `:bd|e#|bd#` because it
-- prevents the empty tab from flashing. This implementation is based off of [this StackOverflow
-- answer](https://stackoverflow.com/a/37866336/262125).
M.buffer_only = function()
  local current_buffer = vim.fn.bufnr("%")
  local buffers = vim.api.nvim_list_bufs()

  for index, buffer_number in ipairs(buffers) do
    if current_buffer ~= buffer_number then
      vim.api.nvim_buf_delete(buffer_number, {})
    end
  end
end

return M
