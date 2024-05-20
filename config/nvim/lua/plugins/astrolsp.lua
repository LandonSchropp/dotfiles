local deep_extend = require("utilities.table").deep_extend

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    ---@type AstroLSPOpts
    return deep_extend(opts, {
      servers = {
        jsonls = {
          init_options = {

            -- Disable the formatter so Prettier can step in.
            provideFormatter = false,
          },
        },

        tsserver = {
          settings = {
            diagnostics = {
              -- Disable the "File is a CommonJS module" error. This error is annoying because it's
              -- applied to configuration files that must be CommonJS modules.
              ignoredCodes = { 80001 },
            },
          },
        },
      },
      mappings = {

        n = {
          -- Remove mappings
          ["<leader>li"] = false,
          ["<leader>uf"] = false,
          ["<leader>uF"] = false,
          ["<leader>uY"] = false,

          -- Remap the info maps to leave space for TypeScript-specific import mapping.
          ["<leader>lI"] = opts.mappings.n["<leader>li"],
          ["<leader>lN"] = opts.mappings.n["<leader>lI"],

          -- Remap the diagnostic mapping to something shorter.
          ["gd"] = opts.mappings.n["<leader>ld"],

          -- Add a handy Mason mapping.
          ["<leader>lm"] = { "<cmd>Mason<cr>", desc = "Mason" },
        },
      },
    })
  end,
}
