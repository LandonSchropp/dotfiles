return {

  opt = {
    --------------
    -- Wrapping --
    --------------

    -- The maximum width of the text being inserted
    textwidth = 100,

    -- Highlight the line after the textwidth
    colorcolumn = "+1",

    ---------------
    -- Indenting --
    ---------------

    -- Round to multiples of the shift width
    shiftround = true,

    -- Indent by two spaces when wrapping
    breakindentopt = "shift:2",

    --------------------
    -- User Interface --
    --------------------

    -- Enable spell checking
    spell = true,

    ------------
    -- Syntax --
    ------------

    -- Display extra whitespace characters
    list = true,

    -- Define the whitespace characters to display.
    listchars = {
      tab = "»·",
      trail = "·",
      nbsp = "·",
    },

    -----------
    -- Other --
    -----------

    -- Automatically :write before running commands
    autowrite = true,

    -- Only join with one space between words
    joinspaces = false,

    -- Ensure there's always a little space above and below the current line
    scrolloff = 2,

    -- Dont use the system clipboard.
    clipboard = {},
  },
}
