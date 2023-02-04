-- Generate documentation snippets.
return {
  "kkoomen/vim-doge",
  build = function()
    vim.cmd("call doge#install()")
  end,
  config = function()
    -- Disable the vim-doge default key mappings.
    vim.api.nvim_set_var("doge_enable_mappings", false)
  end,
}
