local utilities = require('user.utilities')
local auto_command = utilities.auto_command

-- Ignore spell checking for CamelCased items.
-- Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
auto_command([[
  Syntax * syn match CamelCase
    "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
    containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained
]])

-- Ignore spell checking for URLs.
auto_command([[
  Syntax * syn match UrlNoSpell
    '\w\+:\/\/[^[:space:]"\']\+' transparent
    containedin=.*Comment.*,.*String.* contains=@NoSpell contained
]])

-- Ignore spell checking for apostrophes.
-- TODO: Determine if this is only needed for the camel cased items above. If so, figure out how to
-- integrate it with that rule.
auto_command([=[
  Syntax * syn match UrlNoSpell
    '['']s[[:space:]]' transparent
    containedin=.*Comment.*,.*String.* contains=@NoSpell contained
]=])

-- When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
-- purposes.
vim.api.nvim_set_var('is_posix', 1)

-- Display extra whitespace characters
vim.opt.listchars = "tab:»·,trail:·,nbsp:·"
