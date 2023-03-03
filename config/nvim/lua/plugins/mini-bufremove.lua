local keymap_utils = require("util.keymaps")

return {
  "echasnovski/mini.bufremove",
  keys = function(_, keymaps)
    -- Capture the previous implementations of delete so I don't have to worry about behavior
    -- change.
    local delete_keymap = keymap_utils.find_required(keymaps, "<leader>bd")
    local delete_buffer = delete_keymap[2]

    -- Replace the close function with one that opens up Alpha when all of the windows are closed.
    -- https://github.com/echasnovski/mini.nvim/issues/249#issuecomment-1452431730
    delete_keymap[2] = function()
      delete_buffer()

      print("OPENING ALPHA?")

      local buffer_id = vim.api.nvim_get_current_buf()
      local is_empty = vim.api.nvim_buf_get_name(buffer_id) == ""
        and vim.bo[buffer_id].filetype == ""

      if not is_empty then
        return
      end

      -- Open Alpha.
      vim.cmd("Alpha")

      -- Close the empty buffer.
      vim.api.nvim_buf_delete(buffer_id, {})
    end

    keymap_utils.duplicate(keymaps, "<leader>bd", "X")
  end,
}
