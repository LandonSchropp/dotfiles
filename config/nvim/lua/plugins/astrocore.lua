local deep_extend = require("utilities.table").deep_extend
local mappings = require("mappings")

---@type LazySpec
return {
  "AstroNvim/astrocore",
  lazy = false,
  priority = 10000,

  opts = function(_, opts)
    ---@type AstroCoreOpts
    local updated_opts = deep_extend(opts, {
      commands = require("commands"),
      options = {
        opt = {
          -- Disable swap files
          swapfile = false,

          -- The maximum width of the text being inserted
          textwidth = 100,

          -- Highlight the line after the textwidth
          colorcolumn = "+1",

          -- Enable soft wrapping.
          wrap = true,

          -- Round to multiples of the shift width
          shiftround = true,

          -- Indent by two spaces when wrapping
          breakindentopt = "shift:2",

          -- Enable spell checking
          spell = true,

          -- Display extra whitespace characters
          list = true,

          -- Define the whitespace characters to display.
          listchars = {
            tab = "»·",
            trail = "·",
            nbsp = "·",
          },

          -- Automatically :write before running commands
          autowrite = true,

          -- Only join with one space between words
          joinspaces = false,

          -- Ensure there's always a little space above and below the current line
          scrolloff = 2,

          -- Prevent annoying horizontal scrolling
          startofline = false,

          -- Don't use the system clipboard.
          clipboard = {},

          -- Disable modelines because they're pointless and problematic.
          -- https://github.com/AstroNvim/AstroNvim/issues/2725
          modeline = false,
        },
      },
      mappings = mappings(opts.mappings),

      -- Set the file types for common files I work with (passed to `vim.filetype.add`).
      filetypes = {
        extension = {
          env = "sh",
          ["env.local"] = "sh",
        },
        filename = {
          [".envrc"] = "sh",
          Brewfile = "ruby",
        },
      },
    })

    return updated_opts
  end,
}
