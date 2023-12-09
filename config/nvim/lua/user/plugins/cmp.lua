local concatenate = require("user.utilities.table").concatenate

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  opts = function(_, options)
    local cmp = require("cmp")
    options.sources = concatenate(
      options.sources,
      cmp.config.sources({
        { name = "emoji", priority = 700 },
      })
    )

    return options
  end,
}
