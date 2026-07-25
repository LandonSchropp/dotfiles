local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta

local choice = luasnip.c
local restore = luasnip.r

---@alias FunctionNodeBlockOption
---| '"single"' # A function whose curly braces are on a single line
---| '"multi"' # A function whose curly braces are on multiple lines

---@alias FunctionNodeSynchronicityOption
---| '"sync"' # A synchronous function.
---| '"async"' # An asynchronous function.

---@class FunctionNodeOptions
---@field block FunctionNodeBlockOption
---@field synchronicity FunctionNodeSynchronicityOption

---Creates a node for TypeScript arrow functions.
---@param jump_index number The index the node should use for jumping.
---@param key string The key of the restore node to use for the node's content.
---@param options FunctionNodeOptions[] Configures the function nodes the user can choose from.
---@return unknown
local typescript_function_node = function(jump_index, key, options)
  local choices = vim.tbl_map(function(option)
    local prefix = option.synchronicity == "async" and "async " or ""
    local block = option.block == "single" and "{ <> }" or "{\n  <>\n}"

    return format(prefix .. "() =>> " .. block, { restore(1, key) })
  end, options)

  return choice(jump_index, choices, { restore_cursor = true })
end

--- Returns true if the current buffer is a test file.
--- @return boolean True if the current buffer is a test file, false otherwise.
local function is_test()
  return vim.fn.expand("%:t"):match("%.test%.tsx?$") ~= nil
end

return {}
