---@module "lazy"

---@type LazySpec
return {
  "Saghen/blink.cmp",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
  },
  opts = {
    -- Temporarily disable Blink. (https://github.com/AstroNvim/AstroNvim/issues/2797)
    cmdline = {
      enabled = false,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "emoji" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
        },
      },
    },
    completion = {
      menu = {
        draw = {
          columns = {
            {
              "label",
            },
            {
              "kind_icon",
              "kind",
              gap = 1,
            },
          },
        },
      },
    },
  },
}
