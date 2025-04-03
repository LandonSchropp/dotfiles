return {
  "Saghen/blink.cmp",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
  },
  opts = {
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
