local luasnip = require("luasnip")
local parse_snippet = luasnip.parser.parse_snippet

return {
  -- Inline color echos
  parse_snippet("echo-black", 'echo -e "\\033[0;30m$0\\033[0m"'),
  parse_snippet("echo-red", 'echo -e "\\033[0;31m$0\\033[0m"'),
  parse_snippet("echo-green", 'echo -e "\\033[0;32m$0\\033[0m"'),
  parse_snippet("echo-yellow", 'echo -e "\\033[0;33m$0\\033[0m"'),
  parse_snippet("echo-blue", 'echo -e "\\033[0;34m$0\\033[0m"'),
  parse_snippet("echo-purple", 'echo -e "\\033[0;35m$0\\033[0m"'),
  parse_snippet("echo-cyan", 'echo -e "\\033[0;36m$0\\033[0m"'),
  parse_snippet("echo-white", 'echo -e "\\033[0;37m$0\\033[0m"'),

  -- Function color echos
  parse_snippet("echo-black-function", 'echo-black() {\n  echo -e "\\033[0;30m$$1\\033[0m"\n}'),
  parse_snippet("echo-red-function", 'echo-red() {\n  echo -e "\\033[0;31m$$1\\033[0m"\n}'),
  parse_snippet("echo-green-function", 'echo-green() {\n  echo -e "\\033[0;32m$$1\\033[0m"\n}'),
  parse_snippet("echo-yellow-function", 'echo-yellow() {\n  echo -e "\\033[0;33m$$1\\033[0m"\n}'),
  parse_snippet("echo-blue-function", 'echo-blue() {\n  echo -e "\\033[0;34m$$1\\033[0m"\n}'),
  parse_snippet("echo-purple-function", 'echo-purple() {\n  echo -e "\\033[0;35m$$1\\033[0m"\n}'),
  parse_snippet("echo-cyan-function", 'echo-cyan() {\n  echo -e "\\033[0;36m$$1\\033[0m"\n}'),
  parse_snippet("echo-white-function", 'echo-white() {\n  echo -e "\\033[0;37m$$1\\033[0m"\n}'),
}
