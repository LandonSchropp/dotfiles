require("project_nvim").setup({
  -- Don't change into subdirectories in monorepos.
  exclude_dirs = { "packages/*", "plugins/*" },
})
