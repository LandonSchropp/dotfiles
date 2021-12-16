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

lvim.builtin.which_key.mappings["s"]["g"] = {
  lvim.builtin.which_key.mappings["s"]["t"][1],
  "Live Grep",
}

lvim.builtin.which_key.mappings["s"]["t"] = lvim.builtin.which_key.mappings["F"]

-- Set up JavaScript/TypeScript helper
lvim.builtin.which_key.mappings["j"] = {
  name = "JavaScript/TypeScript",
  o = { "<cmd>TSLspOrganize<cr>", "Organize Imports" },
  r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
  i = { "<cmd>TSLspImportAll<cr>", "Import All" },
  c = { "<cmd>TSLspImportCurrent<cr>", "Import Current" },
  d = { "<cmd>DogeGenerate<cr>", "Generate Documentation" },
}
