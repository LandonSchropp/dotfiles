-- When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
-- purposes.
vim.api.nvim_set_var("is_posix", 1)

-- Display extra whitespace characters
vim.opt.list = true
vim.opt.listchars = "tab:»·,trail:·,nbsp:·"
