local core_mappings = require("core.mappings")

-- Prevent Neovim's default ftplugins plugins from enabling keymaps for specific file types.
-- TODO: Should this be moved somewhere else?
vim.api.nvim_set_var("no_plugin_maps", true)

local M = {};

-- Disable *all* of the default NvChad <leader> mappings.
M.disabled = {}

for _, section_values in pairs(core_mappings) do
  for mode, mode_values in pairs(section_values) do
    if type(mode_values) == "table" then
      for mapping, _ in pairs(mode_values) do
        if mapping:match("^<leader>") then
          M.disabled[mode] = M.disabled[mode] or {}
          M.disabled[mode][mapping] = ""
        end
      end
    end
  end
end

-- Add additional mappings.
M.general = {
  n = {

    -- Prevent the cursor from jumping when joining lines
    J = {"mzJ`z", "Join Lines"},

    -- Add mappings to jump between diagnostics.
    ["[["] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic"},
    ["]]"] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Next Diagnostic"},

    -- Create more convenient mappings for yanking to and pasting from the system clipboard.
    gy = {'"*y', "Yank to System Clipboard"},
    gp = {'"*p', "Paste From System Clipboard"},
    gY = {'"*y$', "Yank Until End of Line to System Clipboard"},

    -- Use escape to clear the highlights.
    ["<esc>"] = {":nohlsearch<cr>", "Clear Highlights"},

    -- Set up save and close buffer commands.
    W = {"<cmd>write<cr>", "Write Buffer"},
    X = {core_mappings.tabufline.n["<leader>x"][1], "Close Buffer"},
    Z = {"<cmd>write<bar>BufferKill<cr>", "Write and Close Buffer"},

    -- Open a new buffer.
    ["<leader>n"] = { "<cmd>enew<cr>", "New Buffer" },

    -- Add yank helpers.
    ["<leader>yb"] = { "<cmd>let @+=expand('%:p')<cr>", "Yank Buffer Path" },
  },

  v = {
    -- Create more convenient mappings for yanking to and pasting from the system clipboard.
    gy = {'"*y', "Yank to System Clipboard"},
    gp = {'"*p', "Paste From System Clipboard"},
  }
}

M.lspconfig = {
  n = {

    -- Add LSP Mappings.
    ["<leader>le"] = {
      core_mappings.lspconfig.n["gD"][1],
      "Declaration",
    },

    ["<leader>ld"] = {
      core_mappings.lspconfig.n["gd"][1],
      "Definition",
    },

    ["<leader>lh"] = {
      core_mappings.lspconfig.n["K"][1],
      "Hover",
    },

    ["<leader>li"] = {
      core_mappings.lspconfig.n["gi"][1],
      "Hover",
    },

    ["<leader>ls"] = {
      core_mappings.lspconfig.n["<leader>ls"][1],
      "Signature",
    },

    ["<leader>lt"] = {
      core_mappings.lspconfig.n["<leader>D"][1],
      "Type Definition",
    },

    ["<leader>lr"] = {
      core_mappings.lspconfig.n["<leader>ra"][1],
      "Rename",
    },

    ["<leader>lc"] = {
      core_mappings.lspconfig.n["<leader>ca"][1],
      "Code Action",
    },

    ["<leader>lR"] = {
      core_mappings.lspconfig.n["gr"][1],
      "References",
    },

    -- Add diagnostics mappings.
    ["[["] = {
      core_mappings.lspconfig.n["[d"][1],
      "Previous Diagnostic",
    },

    ["]]"] = {
      core_mappings.lspconfig.n["d]"][1],
      "Next Diagnostic",
    },
  }
}

M.tabufline = {
  n = {
    -- Alias the buffer commands.
    H = {core_mappings.tabufline.n["<TAB>"][1], "Previous Buffer"},
    L = {core_mappings.tabufline.n["<S-Tab>"][1], "Next Buffer"},
  }
}

-- Set up JavaScript/TypeScript mappings.
M.typescript = {
  n = {
    ["<leader>ji"] = {
      function()
        require('typescript').actions.addMissingImports()
      end,
      "Import All"
    },
    ["<leader>jf"] = {
      function()
        require('typescript').actions.fixAll()
      end,
      "Fix Issues"
    },
  }
}

-- Set up Doge mappings.
M.doge = {
  n = {
    ["<leader>jd"] = { "<cmd>DogeGenerate<cr>", "Import All" },
  }
}

return M
