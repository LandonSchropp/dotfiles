-- Change the cursor when in insert mode
vim.opt.guicursor = "i:ver1,a:blinkon1"

--------------
-- Wrapping --
--------------

-- The maximum width of the text being inserted
vim.opt.textwidth = 100

-- Wrap characters at the breakat point rather than the edge of the screen
vim.opt.linebreak = true

-- When text wraps, it should continue to be indented
vim.opt.breakindent = true

-- Highlight the line after the textwidth
vim.opt.colorcolumn = "+1"

---------------
-- Indenting --
---------------

-- Round to multiples of the shift width
vim.opt.shiftround = true

-- Indent by two spaces when wrapping
vim.opt.breakindentopt = "shift:2"

--------------------
-- User Interface --
--------------------

-- Enable spell checking
vim.opt.spell = true

-- Only use one line for commands.
vim.opt.cmdheight = 0

-----------
-- Other --
-----------

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Only join with one space between words
vim.opt.joinspaces = false

-- Ensure there's always a little space above and below the current line
vim.opt.scrolloff = 2

-- Dont use the system clipboard.
vim.opt.clipboard = {}
