local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local choice = luasnip.c
local dynamic = luasnip.d
local func = luasnip.f
local insert = luasnip.i
local snippet = luasnip.s
local snippet_node = luasnip.sn

---A helper function that convers camel case to dash case.
---@param string string The string to dasherize.
---@return string The dasherized value.
local dasherize = function(string)
  return string:gsub("([A-Z])", "-%1"):gsub("%W+", "-"):gsub("^-", ""):lower()
end

return {
  snippet(
    "functional-component",
    format(
      [[
        <>type <>Props = {
        <>
        };

        export function <>({ <> }: <>Props) {
          return <<<> <>>>
            <>
          <</<>>>
        }
      ]],
      {
        -- Imports
        func(function(args)
          if args[1][1]:match("className") then
            return { 'import classNames from "classnames";', "", "" }
          else
            return ""
          end
        end, { 2 }),
        rep(1),
        dynamic(3, function(args)
          local props = vim.split(args[1][1], "%W+", { trimempty = true })
          local nodes = {}

          -- FIX: There's likely a much better way to do this, but I gave up trying to figure out
          -- multi-line snippets with a mix of text nodes, choice nodes and insert nodes.
          local template = table.concat(
            vim.tbl_map(function()
              return "  <>"
            end, props),
            "\n"
          )

          for index, prop in ipairs(props) do
            table.insert(
              nodes,
              choice(index, {
                format(prop .. ": <>", { insert(1, "string") }),
                format(prop .. "?: <>", { insert(1, "string") }),
              })
            )
          end

          return snippet_node(nil, format(template, nodes, { dedent = false }), {})
        end, { 2 }),
        insert(1),
        insert(2),
        rep(1),
        insert(4, "div"),
        func(function(args)
          if args[2][1]:match("className") then
            return 'className={ classNames("' .. dasherize(args[1][1]) .. '", className) }'
          else
            return 'className="' .. dasherize(args[1][1]) .. '"'
          end
        end, { 1, 2 }),
        insert(0),
        rep(4),
      }
    )
  ),
}
