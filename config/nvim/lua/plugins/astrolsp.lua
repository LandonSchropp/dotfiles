---@module "lazy"
---@module "astrolsp"

local deep_extend = require("utilities.table").deep_extend

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    ---@type AstroLSPOpts
    return deep_extend(opts, {
      config = {
        -- Disable emmet-ls to prevent annoying autocompletions in `.tsx` files.
        emmet_ls = {
          enabled = false,
        },

        -- Disable the JSON formatter so Prettier can step in.
        jsonls = {
          init_options = {
            provideFormatter = false,
          },
        },

        -- Disable the requirement for using flat config in ESLint.
        eslint = {
          settings = {
            useFlatConfig = false,
          },
        },

        -- Give vtsls more memory to work with.
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
          },
        },

        -- Disable the "File is a CommonJS module" error. This error is annoying because it's
        -- applied to configuration files that must be CommonJS modules.
        tsserver = {
          settings = {
            diagnostics = {
              ignoredCodes = { 80001 },
            },
          },
        },

        -- Prevent Ruby LSP from prompting to run migrations.
        ruby_lsp = {
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
        },
      },
      mappings = {

        n = {
          -- Remove mappings
          ["<Leader>li"] = false,
          ["<Leader>uY"] = false,

          -- Remap the info maps to leave space for TypeScript-specific import mapping.
          ["<Leader>lI"] = opts.mappings.n["<Leader>li"],
          ["<Leader>lN"] = opts.mappings.n["<Leader>lI"],

          -- Remap the diagnostic mapping to something shorter.
          ["gd"] = opts.mappings.n["<Leader>ld"],
        },
      },
      on_attach = function(client, buffer)
        if client.name == "vtsls" then
          vim.keymap.set(
            "n",
            "<leader>li",
            "<cmd>VtsExec add_missing_imports<cr>",
            { desc = "Add missing imports", buffer = buffer }
          )

          vim.keymap.set(
            "n",
            "<leader>lu",
            "<cmd>VtsExec remove_unused_imports<cr>",
            { desc = "Remove unused imports", buffer = buffer }
          )
        end
      end,
    })
  end,
}
