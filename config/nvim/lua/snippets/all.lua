local luasnip = require("luasnip")
local parse_snippet = luasnip.parser.parse_snippet

local format = require("luasnip.extras.fmt").fmta
local snippet_utils = require("util.snippet")

local constantize = snippet_utils.constantize

local dynamic = luasnip.d
local insert = luasnip.i
local snippet = luasnip.s
local snippet_node = luasnip.sn
local text = luasnip.t

local BASH_SHEBANG = "#!/usr/bin/env bash"
local RUBY_SHEBANG = "#!/usr/bin/env ruby"

return {
  parse_snippet("bash-shebang", BASH_SHEBANG .. "\n\n$0"),
  snippet(
    "bash-script",
    format(
      [[
        <>

        set -euo pipefail

        if [ "$#" -ne <> ]; then
        <>
        <>
      ]],
      {
        text(BASH_SHEBANG),
        insert(1, "1"),
        dynamic(2, function(args)
          local number_of_arguments = tonumber(args[1][1]) or 0

          local usage_template = ""
          local arguments_template = number_of_arguments == 0 and "" or "\n"
          local nodes = {}

          for index = 1, number_of_arguments do
            usage_template = usage_template .. " <<<>>>"
            arguments_template = arguments_template .. ('<>="$%d"\n'):format(index)

            table.insert(nodes, index, insert(index, "argument" .. tostring(index)))
            table.insert(nodes, constantize(index))
          end

          local template = '  >>&2 echo "Usage: $0'
            .. usage_template
            .. '"\n  exit 1\nfi\n'
            .. arguments_template
            .. "\n"

          return snippet_node(nil, format(template, nodes, { dedent = false }))
        end, { 1 }),
        insert(0, "# TODO: Implement the script!"),
      }
    )
  ),
  parse_snippet("ruby-shebang", RUBY_SHEBANG .. "\n\n$0"),
  snippet(
    "ruby-script",
    format(
      [[
        <>

        # frozen_string_literal: true

        unless ARGV.length == <>
        <>
        <>
      ]],
      {
        text(RUBY_SHEBANG),
        insert(1, "1"),
        dynamic(2, function(args)
          local number_of_arguments = tonumber(args[1][1]) or 0

          local usage_template = ""
          local arguments_template = number_of_arguments == 0 and "" or "\n"
          local nodes = {}

          for index = 1, number_of_arguments do
            usage_template = usage_template .. " <<<>>>"
            arguments_template = arguments_template .. ("<> = ARGV[%d]\n"):format(index - 1)

            table.insert(nodes, index, insert(index, "argument" .. tostring(index)))
            table.insert(nodes, constantize(index))
          end

          local template = '  warn "Usage: #{$PROGRAM_NAME}'
            .. usage_template
            .. '"\n  exit 1\nend\n'
            .. arguments_template
            .. "\n"

          return snippet_node(nil, format(template, nodes, { dedent = false }))
        end, { 1 }),
        insert(0, "# TODO: Implement the script!"),
      }
    )
  ),
}
