return {
  "zbirenbaum/copilot.lua",
  -- Enable Copilot, but disable the built-in suggestions since we'll be using copilot-cmp for
  -- completion instead.
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
