-- NOTE: This plugin is installed via AstroCommunity. It's included here for configuration.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      position = "inline",
      icons = { "󰉫", "󰉬", "󰉭", "󰉮", "󰉯", "󰉰" },
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
      custom = {
        -- This must be included to override the default todo value, which interferes with the
        -- custom cancelled value since it has the same `raw`.
        todo = { raw = "[-]", rendered = "󰜺", highlight = "RenderMarkdownCancelled" },

        -- Standard icons
        incomplete = { raw = "[/]", rendered = "", highlight = "RenderMarkdownIncomplete" },
        cancelled = { raw = "[-]", rendered = "󰜺", highlight = "RenderMarkdownCancelled" },
        forwarded = { raw = "[>]", rendered = "", highlight = "RenderMarkdownForwarded" },
        scheduled = { raw = "[<]", rendered = "󰸘", highlight = "RenderMarkdownScheduled" },

        -- Non-standard extra icons
        question = { raw = "[?]", rendered = "?", highlight = "RenderMarkdownQuestion" },
        important = { raw = "[!]", rendered = "", highlight = "RenderMarkdownImportant" },
        star = { raw = "[*]", rendered = "", highlight = "RenderMarkdownStar" },
        quote = { raw = '["]', rendered = "", highlight = "RenderMarkdownQuote" },
        location = { raw = "[l]", rendered = "", highlight = "RenderMarkdownLocation" },
        bookmark = { raw = "[b]", rendered = "", highlight = "RenderMarkdownBookmark" },
        information = { raw = "[i]", rendered = "", highlight = "RenderMarkdownInformation" },
        savings = { raw = "[S]", rendered = "", highlight = "RenderMarkdownSavings" },
        idea = { raw = "[I]", rendered = "", highlight = "RenderMarkdownIdea" },
        pros = { raw = "[p]", rendered = "", highlight = "RenderMarkdownPros" },
        cons = { raw = "[c]", rendered = "", highlight = "RenderMarkdownCons" },
        fire = { raw = "[f]", rendered = "", highlight = "RenderMarkdownFire" },
        key = { raw = "[k]", rendered = "", highlight = "RenderMarkdownKey" },
        win = { raw = "[w]", rendered = "󱁖", highlight = "RenderMarkdownWin" },
        up = { raw = "[u]", rendered = "󰔵", highlight = "RenderMarkdownUp" },
        down = { raw = "[d]", rendered = "󰔳", highlight = "RenderMarkdownDown" },
      },
    },
    code = {
      style = "normal",
      -- border = "thick",
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
