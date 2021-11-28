local luasnip = require("luasnip")

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node

local describe = snippet(
  "describe",
  text_node({ 'describe("' }),
  insert_node(1),
  text_node({ '", () => {\n' }),
  text_node({ "\n" }),
  text_node({ "});\n" })
)

luasnip.snippets = {
  all = {
    describe,
  },
}
