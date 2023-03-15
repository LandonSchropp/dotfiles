local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta
local string_node = require("util.snippet").string_node

local choice = luasnip.c
local insert = luasnip.i
local snippet = luasnip.s
local restore = luasnip.r

---@alias blockNodeType
---| '"inline"' # A block enclosed in curly braces (`{}`)
---| '"multi-line"' # A block spread over multiple lines and enclosed in `do` and `end`

---Creates a node for Ruby blocks.
---@param jump_index number The index the node should use for jumping.
---@param key string The key of the restore node to use for the node's content.
---@param types blockNodeType[] A list of types to allow for the block node. Defaults to `{
---"multi-line", "inline" }`
---@return unknown
local block_node = function(jump_index, key, types)
  local choices = vim.tbl_map(function(type)
    if type == "inline" then
      return format("{ <> }", { restore(1, key) })
    elseif type == "multi-line" then
      return format("do\n  <>\nend", { restore(1, key) })
    else
      error("An unrecognized type '" .. type .. "' was provided to block_node.")
    end
  end, types)

  return choice(jump_index, choices, { restore_cursor = true })
end

-- A wrapper for the snippet function that configures stores in a more concise way.
local snippet_with_stores = function(trigger, node, keys)
  local stored = {}

  for index, key in ipairs(keys) do
    stored[key] = insert(index)
  end

  return snippet(trigger, node, { stored = stored })
end

return {
  snippet_with_stores(
    "describe",
    format("describe <> <>", {
      string_node(1, "description", { "double", "single", "bare" }),
      block_node(2, "text", { "multi-line" }),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "context",
    format("context <> <>", {
      string_node(1, "description"),
      block_node(2, "text", { "multi-line" }),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "it",
    format("it <> <>", {
      string_node(1, "description"),
      block_node(2, "text", { "multi-line", "inline" }),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "subject",
    format("subject <>", {
      block_node(1, "text", { "inline", "multi-line" }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "before",
    format("before <>", {
      block_node(1, "text", { "inline", "multi-line" }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "let",
    format("let(<>) <>", {
      insert(1),
      block_node(2, "text", { "inline", "multi-line" }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "let!",
    format("let!(<>) <>", {
      insert(1),
      block_node(2, "text", { "inline", "multi-line" }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "expect",
    format("expect(<>)<>", {
      insert(1),
      choice(2, {
        format(".to <>", restore(1, "text")),
        format(".not_to <>", restore(1, "text")),
      }, { restore_cursor = true }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "it { is_expected.to }",
    format("it { is_expected<> }", {
      choice(1, {
        format(".to <>", restore(1, "text")),
        format(".not_to <>", restore(1, "text")),
      }, { restore_cursor = true }),
    }),
    { "text" }
  ),
}
