local spectre = require("spectre")

-- Add Trouble.
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
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
