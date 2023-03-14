local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta
local table_utils = require("util.table")

local choice = luasnip.c
local insert = luasnip.i
local snippet = luasnip.s
local restore = luasnip.r

-- Creates a reusable node for Ruby blocks.
local block_node = function(jump_index, key, options)
  options = vim.tbl_extend("force", { inline_default = false }, options or {})

  local choices = {
    format("do\n  <>\nend", { restore(1, key) }),
    format("{ <> }", { restore(1, key) }),
  }

  if options.inline_default then
    choices = table_utils.reverse(choices)
  end

  return choice(jump_index, choices, { restore_cursor = true })
end

-- Creates a reusable node for Ruby strings.
local string_node = function(jump_index, key, options)
  options = vim.tbl_extend("force", { include_quoteless = false }, options or {})

  local choices = {
    format('"<>"', restore(1, key)),
    format("'<>'", restore(1, key)),
  }

  if options.include_quoteless then
    table.insert(choices, format("<>", restore(1, key)))
  end

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
      string_node(1, "description", { include_quoteless = true }),
      block_node(2, "text"),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "context",
    format("context <> <>", {
      string_node(1, "description"),
      block_node(2, "text"),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "it",
    format("it <> <>", {
      string_node(1, "description"),
      block_node(2, "text"),
    }),
    { "description", "text" }
  ),
  snippet_with_stores(
    "subject",
    format("subject <>", {
      block_node(1, "text", { inline_default = true }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "before",
    format("before <>", {
      block_node(1, "text", { inline_default = true }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "let",
    format("let(<>) <>", {
      insert(1),
      block_node(2, "text", { inline_default = true }),
    }),
    { "text" }
  ),
  snippet_with_stores(
    "let!",
    format("let!(<>) <>", {
      insert(1),
      block_node(2, "text", { inline_default = true }),
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
