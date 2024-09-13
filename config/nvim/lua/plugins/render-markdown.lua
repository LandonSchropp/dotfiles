-- NOTE: This plugin is installed via AstroCommunity. It's included here for configuration.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      position = "inline",
      icons = { "󰉫", "󰉬", "󰉭", "󰉮", "󰉯", "󰉰" },
    },
    bullet = {
      icons = { "•" },
    },
    quote = {
      icon = "▎",
    },
    link = {
      email = " ",
      custom = {
        web = { pattern = "^http[s]?://", icon = " ", highlight = "RenderMarkdownLink" },
      },
    },
  },
}
