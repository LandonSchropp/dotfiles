-- Automatically resize splits so it's easier to see their content.
return {
  "anuvyklack/windows.nvim",
  dependencies = { "anuvyklack/middleclass" },
  config = function()
    require("windows").setup()
  end,
}
