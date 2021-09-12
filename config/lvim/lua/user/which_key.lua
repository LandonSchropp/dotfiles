local spectre = require("spectre")

-- Add Trouble.
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TodoTrouble<cr>", "Todos" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- Add Spectre.
lvim.builtin.which_key.mappings["F"] = {
  function()
    spectre.open({
      is_open_target_win = false,
      is_insert_mode = true,
    })
  end,
  "Find Text",
}

lvim.builtin.which_key.mappings["s"]["g"] = lvim.builtin.which_key.mappings["s"]["t"]
lvim.builtin.which_key.mappings["s"]["g"][2] = "Live Grep"
lvim.builtin.which_key.mappings["s"]["t"] = lvim.builtin.which_key.mappings["F"]

-- Add nvim-lsp-ts-utils to the Language Server menu.
lvim.builtin.which_key.mappings["l"]["t"] = {
  name = "+TypeScript",
  o = { "<cmd>TSLspOrganize<cr>", "Organize Imports" },
  r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
  i = { "<cmd>TSLspImportAll<cr>", "Import All" },
}

-- Add vim-doge
vim.api.nvim_set_var("g:doge_enable_mappings", 0)
lvim.builtin.which_key.mappings["l"]["d"] = { "<cmd>DogeGenerate<cr>", "Generate Documentation" }
