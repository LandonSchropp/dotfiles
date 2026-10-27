-- Soft wrap Markdown instead of inserting line breaks at the global textwidth.
vim.opt_local.textwidth = 0
vim.opt_local.formatoptions:remove({ "t", "c" })
