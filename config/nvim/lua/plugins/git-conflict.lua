---@module "lazy"

---@type LazySpec
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  opts = {
    default_mappings = false,
  },
  keys = {
    { "<Leader>gq", "<cmd>GitConflictListQf<cr>",       desc = "Conflict list" },
    { "]x",         "<cmd>GitConflictNextConflict<cr>", desc = "Next conflict" },
    { "[x",         "<cmd>GitConflictPrevConflict<cr>", desc = "Previous conflict" },
    { "go",         "<cmd>GitConflictChooseOurs<cr>",   desc = "Choose ours (current)" },
    { "gt",         "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs (incoming)" },
    { "gb",         "<cmd>GitConflictChooseBoth<cr>",   desc = "Choose both" },
    { "gn",         "<cmd>GitConflictChooseNone<cr>",   desc = "Choose none" },
  },
}
