return function(default_maps)
  -- Define the overrides.
  local maps = { n = {}, v = {} }

  ----------------------
  -- Disable Defaults --
  ----------------------

  -- Define a list of default AstroNvim normal model mapping _prefixes_ to remove.
  local normal_mode_prefixes_to_remove = {
    "<leader>w",
    "<leader>q",
    "<leader>h",
    "<leader>fn",
    "gx",
    "<C-s>",
    "<C-q>",
    "|",
    "\\",
    "<leader>d",
    "<leader>c",
    "<leader>C",
    ">b",
    "<b",
    "<leader>b\\",
    "<leader>b|",
    "]t",
    "[t",
    "<leader>o",
    "<leader>u",
  }

  -- Remove the AstroNvim normal mode prefixes I don't like.
  for key, _ in pairs(default_maps.n) do
    for _, prefix in pairs(normal_mode_prefixes_to_remove) do
      if key:sub(1, #prefix) == prefix then
        maps.n[key] = false
      end
    end
  end

  -------------
  -- General --
  -------------

  -- Disable the visual mode indentation mappings I don't like.
  maps.v["<"] = false
  maps.v[">"] = false

  -- Prevent the cursor from jumping when joining lines
  maps.n["J"] = { "mzJ`z", desc = "Join" }

  -- Create more convenient mappings for yanking to and pasting from the system clipboard.
  maps.n["gy"] = { '"*y', desc = "Yank to system clipboard" }
  maps.n["gp"] = { '"*p', desc = "Paste from system clipboard" }
  maps.n["gY"] = { '"*y$', desc = "Yank until end of line to system clipboard" }

  -- Use escape to clear the highlights.
  maps.n["<esc>"] = { ":nohlsearch<cr>", desc = "Clear highlights" }

  -- Set up save and close buffer commands.
  maps.n["W"] = { "<cmd>write<cr>", desc = "Write buffer" }
  maps.n["X"] = default_maps.n["<leader>c"]
  maps.n["<c-x>"] = default_maps.n["<leader>C"]
  maps.n["Z"] = { "<cmd>write<bar>BufferKill<cr>", desc = "Write and close buffer" }

  -- Open a new buffer.
  maps.n["<leader>n"] = default_maps.n["<leader>fn"]

  -- Add yank helpers.
  maps.n["<leader>yb"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "Yank buffer path" }

  -- Create more convenient mappings for yanking to and pasting from the system clipboard.
  maps.v["gy"] = { '"*y', desc = "Yank to system clipboard" }
  maps.v["gp"] = { '"*p', desc = "Paste from system clipboard" }

  ---------
  -- LSP --
  ---------

  -- Add mappings to jump between diagnostics.
  maps.n["[["] = {
    function()
      vim.diagnostic.goto_prev()
    end,
    desc = "Previous Diagnostic",
  }

  maps.n["]]"] = {
    function()
      vim.diagnostic.goto_prev()
    end,
    desc = "Next Diagnostic",
  }

  ---------------------------
  -- JavaScript/TypeScript --
  ---------------------------

  -- Add missing imports
  maps.n["<leader>ji"] = {
    function()
      require("typescript").actions.addMissingImports()
    end,
    desc = "Import All",
  }

  -- Fix all issues
  maps.n["<leader>jf"] = {
    function()
      require("typescript").actions.fixAll()
    end,
    desc = "Fix Issues",
  }

  ----------
  -- Doge --
  ----------

  -- Generate documentation
  maps.n["<leader>ld"] = { "<cmd>DogeGenerate<cr>", desc = "Generate documentation" }

  ---------------
  -- Telescope --
  ---------------

  -- Replace the built-in Telescope find_files matcher with something that will find hidden files,
  -- respect the .gitignore implementation, and not display the .git directory contents.
  maps.n["<leader>ff"] = {
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git/<cr>",
    desc = "Find file",
  }

  -------------
  -- Spectre --
  -------------

  -- Use Spectre for find and replace.
  maps.n["<leader>fr"] = {
    function()
      require("spectre").open({
        is_open_target_win = false,
        is_insert_mode = true,
      })
    end,
    desc = "Find and replace",
  }

  -- Return the mappings with the overrides applied.
  return vim.tbl_deep_extend("force", default_maps, maps)
end
