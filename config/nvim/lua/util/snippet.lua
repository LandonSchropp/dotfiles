local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta

local choice = luasnip.c
local insert = luasnip.i
local restore = luasnip.r
local snippet = luasnip.s

local M = {}

-- A wrapper for the snippet function that configures stores in a more concise way.
---Creates a snippet that contains insert nodes in the specified stores.
---@param trigger string The trigger for the snippet.
---@param node unknown The snippet's node.
---@param keys string[] A list of stores to create insert nodes for. The order of the keys dictates
---the order of the jumps for the inserts.
---@return unknown The snippet.
M.snippet_with_stores = function(trigger, node, keys)
  local stored = {}

  for index, key in ipairs(keys) do
    stored[key] = insert(index)
  end

  return snippet(trigger, node, { stored = stored })
end

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
