---@module "lazy"

-- NOTE: This plugin is installed via AstroCommunity. It's included here for configuration.
---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",

  -- Markdown rendering principles:
  --
  -- 1. Use non-intrusive character replacements (e.g. dashes → bullets, pipes/dashes → table chars,
  -- greater thans → lines)
  -- 2. Add background colors to structural elements (headers, code blocks) for readability
  -- 3. Display element type indicators in side column for easy document scanning
  -- 4. Avoid concealed text that causes layout jumps on hover (checkboxes, inline links)
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
      border = "thin",
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
