local luasnip = require("luasnip")
local parse_snippet = luasnip.parser.parse_snippet

local format = require("luasnip.extras.fmt").fmta
local snippet_utils = require("util.snippet")

local constantize = snippet_utils.constantize

local snippet = luasnip.s
local snippet_node = luasnip.sn
local insert = luasnip.i
local dynamic = luasnip.d

return {
  parse_snippet("bash-shebang", "#!/usr/bin/env bash\n\n$0"),
  snippet(
    "bash-script",
    format(
      [[
        #!/usr/bin/env bash

        set -euo pipefail

        if [ "$#" -ne <> ]; then
        <>
        <>
      ]],
      {
        insert(1, "1"),
        dynamic(2, function(args)
          local number_of_arguments = tonumber(args[1][1]) or 0

          local usage_template = ""
          local arguments_template = number_of_arguments == 0 and "" or "\n"
          local nodes = {}

          for index = 1, number_of_arguments do
            usage_template = usage_template .. " <<<>>>"
            arguments_template = arguments_template .. ('<>="$%d"\n'):format(index, index)

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
  parse_snippet("ruby-shebang", "#!/usr/bin/env ruby\n\n$0"),
  parse_snippet(
    "ruby-script",
    [[
      #!/usr/bin/env ruby

      unless ARGV.length == $1
        STDERR.puts "Usage: #{\$0} $2"
        exit 1
      fi
      
      $0
    ]]
  ),
}
