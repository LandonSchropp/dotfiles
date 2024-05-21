local deep_extend = require("utilities.table").deep_extend

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    ---@type AstroLSPOpts
    return deep_extend(opts, {
      config = {
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
          ["<Leader>li"] = false,
          ["<Leader>uf"] = false,
          ["<Leader>uF"] = false,
          ["<Leader>uY"] = false,

          -- Remap the info maps to leave space for TypeScript-specific import mapping.
          ["<Leader>lI"] = opts.mappings.n["<Leader>li"],
          ["<Leader>lN"] = opts.mappings.n["<Leader>lI"],

          -- Remap the diagnostic mapping to something shorter.
          ["gd"] = opts.mappings.n["<Leader>ld"],

          -- Add a handy Mason mapping.
          ["<Leader>lm"] = { "<cmd>Mason<cr>", desc = "Mason" },
        },
      },
    })
  end,
}
