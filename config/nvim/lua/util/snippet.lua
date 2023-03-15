local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta

local choice = luasnip.c
local restore = luasnip.r

local M = {}

---@alias stringNodeType
---| '"single"' # A string with single quotes
---| '"double"' # A string with double quotes
---| '"bare"' # A value without any quotes

---Creates a node for strings.
---@param jump_index number The index the node should use for jumping.
---@param key string The key of the restore node to use for the node's content.
---@param types? stringNodeType[] A list of types to allow for the string node. Defaults to `{
---"double", "single" }`
---@return unknown Returns a Luasnip node for a string.
M.string_node = function(jump_index, key, types)
  types = types or { "double", "single" }

  local choices = vim.tbl_map(function(type)
    if type == "single" then
      return format("'<>'", restore(1, key))
    elseif type == "double" then
      return format('"<>"', restore(1, key))
    elseif type == "bare" then
      return format("<>", restore(1, key))
    else
      error("An unrecognized type '" .. type .. "' was provided to string_node.")
    end
  end, types)

  return choice(jump_index, choices, { restore_cursor = true })
end

return M
