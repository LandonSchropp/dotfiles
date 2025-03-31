-- NOTE: This plugin is installed via AstroCommunity. It's included here for configuration.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  opts = {
    file_types = { "markdown", "codecompanion" },
    heading = {
      position = "inline",
      icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
      width = "block",
      min_width = 100,
    },
    bullet = {
      icons = { "•" },
    },
    checkbox = {
      checked = {
        icon = "",
      },
      unchecked = {
        icon = "",
      },
    },
    code = {
      style = "normal",
      width = "block",
      min_width = 100,
    },
    quote = {
      icon = "▎",
      repeat_linebreak = true,
    },
    link = {
      email = " ",
      custom = {
        web = { pattern = "^http[s]?://", icon = " ", highlight = "RenderMarkdownLink" },
      },
    },
    pipe_table = {
      preset = "round",
    },
  },
}
