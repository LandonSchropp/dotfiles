local spectre = require("spectre")
lvim.builtin.which_key.mappings["t"] = {
  "<cmd>Trouble lsp_document_diagnostics<cr>",
  "Trouble Diagnostics",
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
