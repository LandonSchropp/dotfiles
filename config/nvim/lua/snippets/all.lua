local luasnip = require("luasnip")
local parse_snippet = luasnip.parser.parse_snippet

return {
  parse_snippet("bash-shebang", "#!/usr/bin/env bash\n\n$0"),
  parse_snippet(
    "bash-script",
    [[
      #!/usr/bin/env bash

      set -euo pipefail

      if [ "$#" -ne $1 ]; then
        >&2 echo "Usage: $2"
        exit 1
      fi
      
      $0
    ]]
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
