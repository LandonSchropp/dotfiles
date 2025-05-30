local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta
local snippet_utils = require("utilities.snippet")
local rep = require("luasnip.extras").rep

local snippet_with_stores = snippet_utils.snippet_with_stores
local string_node = snippet_utils.string_node

local choice = luasnip.c
local func = luasnip.f
local insert = luasnip.i
local restore = luasnip.r
local snippet = luasnip.s

local FUNCTION_TYPE_TEMPLATE = { regular = "function() ", arrow = "() =>> " }
local FUNCTION_BLOCK_TEMPLATE = { single = "{ <> }", multi = "{\n  <>\n}" }
local FUNCTION_SYNCHRONICITY_TEMPLATE = { sync = "", async = "async " }

---@alias FunctionNodeTypeOption
---| '"regular"' # A plain old JavaScript function (`function() {}`)
---| '"arrow"' # An arrow function (`() => {}`).

---@alias FunctionNodeBlockOption
---| '"single"' # A function whose curly braces are on a single line
---| '"multi"' # A function whose curly braces are on multiple lines

---@alias FunctionNodeSynchronicityOption
---| '"sync"' # A synchronous function.
---| '"async"' # An asynchronous function.

---@class FunctionNodeOptions
---@field type FunctionNodeTypeOption
---@field block FunctionNodeBlockOption
---@field synchronicity FunctionNodeSynchronicityOption

---Creates a node for JavaScript functions.
---@param jump_index number The index the node should use for jumping.
---@param key string The key of the restore node to use for the node's content.
---@param options FunctionNodeOptions[] Configures the function nodes the user can choose from.
---@return unknown
local javascript_function_node = function(jump_index, key, options)
  local choices = vim.tbl_map(function(option)
    local template = FUNCTION_SYNCHRONICITY_TEMPLATE[option.synchronicity]
        .. FUNCTION_TYPE_TEMPLATE[option.type]
        .. FUNCTION_BLOCK_TEMPLATE[option.block]

    return format(template, { restore(1, key) })
  end, options)

  return choice(jump_index, choices, { restore_cursor = true })
end

local function is_test()
  return vim.fn.expand("%:t"):match("%.test%.[jt]sx?$") ~= nil
end

return {
  snippet_with_stores(
    "describe",
    format("describe(<>, <>);", {
      string_node(1, "description"),
      javascript_function_node(2, "text", {
        { type = "arrow", block = "multi", synchronicity = "sync" },
      }),
    }),
    { "description", "text" },
    { condition = is_test, show_condition = is_test }
  ),
  snippet_with_stores(
    "it",
    format("it(<>, <>);", {
      string_node(1, "description"),
      javascript_function_node(2, "text", {
        { type = "arrow", block = "multi", synchronicity = "sync" },
        { type = "arrow", block = "multi", synchronicity = "async" },
      }),
    }),
    { "description", "text" },
    { condition = is_test, show_condition = is_test }
  ),
  snippet_with_stores(
    "beforeEach",
    format("beforeEach(<>);", {
      javascript_function_node(1, "text", {
        { type = "arrow", block = "single", synchronicity = "sync" },
        { type = "arrow", block = "multi",  synchronicity = "sync" },
        { type = "arrow", block = "single", synchronicity = "async" },
        { type = "arrow", block = "multi",  synchronicity = "async" },
      }),
    }),
    { "text" },
    { condition = is_test, show_condition = is_test }
  ),
  snippet_with_stores(
    "expect",
    format("<>.<>(<>);", {
      choice(1, {
        format("expect(<>)", { restore(1, "target") }),
        format("return expect(<>).resolves", { restore(1, "target") }),
        format("return expect(<>).rejects", { restore(1, "target") }),
      }, { restore_cursor = true }),
      insert(2, "toEqual"),
      insert(3),
    }),
    { "target" },
    { condition = is_test, show_condition = is_test }
  ),
  snippet("/**", format("/**\n * <>\n */", { insert(0) })),
  snippet_with_stores(
    "eslint-disable",
    format("<>eslint-disable <><>\n<>\n/* eslint-enable <> */", {
      func(function(_, _)
        local line = vim.api.nvim_get_current_line()
        return line:match("^%s*/%*") and "" or "/* "
      end),
      insert(1),
      func(function(_, _)
        local line = vim.api.nvim_get_current_line()
        return line:match("%*/$") and "" or " */"
      end),
      insert(2),
      rep(1),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "eslint-disable-next-line",
    format("<>eslint-disable-next-line <>\n<>", {
      func(function(_, _)
        local line = vim.api.nvim_get_current_line()
        return line:match("^%s*//") and "" or "// "
      end),
      insert(1),
      insert(2),
    }),
    { "text" }
  ),
}
