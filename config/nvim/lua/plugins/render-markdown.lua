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
    file_types = { "markdown" },
    -- Render in every mode, including insert, rather than only in normal, command, and terminal
    -- modes. Without this option, the sign column icons and background highlights disappear when
    -- entering insert mode. This is safe to enable because `conceallevel` is set to `0` below,
    -- which means no text is actually hidden. As a result, there is no raw-versus-rendered text
    -- to swap between modes, and only the signs and backgrounds change, which is what we want to
    -- keep visible at all times.
    render_modes = true,
    win_options = { conceallevel = { rendered = 0 } },
    nested = false,
    heading = {
      position = "inline",
      icons = {},
      signs = { "󰉫", "󰉬", "󰉭", "󰉮", "󰉯", "󰉰" },
      width = "block",
      min_width = 100,
    },
    bullet = {
      icons = { "•" },
    },
    checkbox = {
      bullet = true,
      checked = {
        icon = "[]",
      },
      unchecked = {
        icon = "[ ]",
      },
      custom = {
        -- This must be included to override the default todo value, which interferes with the
        -- custom cancelled value since it has the same `raw`.
        todo = { raw = "[-]", rendered = "[󰜺]" },
        -- Standard icons
        incomplete = { raw = "[/]", rendered = "[]", highlight = "RenderMarkdownIncomplete" },
        cancelled = { raw = "[-]", rendered = "[−]", highlight = "RenderMarkdownCancelled" },
        forwarded = { raw = "[>]", rendered = "[]", highlight = "RenderMarkdownForwarded" },
        scheduled = { raw = "[<]", rendered = "[󰸘]", highlight = "RenderMarkdownScheduled" },

        -- Non-standard extra icons
        question = { raw = "[?]", rendered = "[?]", highlight = "RenderMarkdownQuestion" },
        important = { raw = "[!]", rendered = "[]", highlight = "RenderMarkdownImportant" },
        star = { raw = "[*]", rendered = "[]", highlight = "RenderMarkdownStar" },
        quote = { raw = '["]', rendered = "[]", highlight = "RenderMarkdownQuote" },
        location = { raw = "[l]", rendered = "[]", highlight = "RenderMarkdownLocation" },
        bookmark = { raw = "[b]", rendered = "[]", highlight = "RenderMarkdownBookmark" },
        information = { raw = "[i]", rendered = "[]", highlight = "RenderMarkdownInformation" },
        savings = { raw = "[S]", rendered = "[]", highlight = "RenderMarkdownSavings" },
        idea = { raw = "[I]", rendered = "[]", highlight = "RenderMarkdownIdea" },
        pros = { raw = "[p]", rendered = "[]", highlight = "RenderMarkdownPros" },
        cons = { raw = "[c]", rendered = "[]", highlight = "RenderMarkdownCons" },
        fire = { raw = "[f]", rendered = "[]", highlight = "RenderMarkdownFire" },
        key = { raw = "[k]", rendered = "[]", highlight = "RenderMarkdownKey" },
        win = { raw = "[w]", rendered = "[󱁖]", highlight = "RenderMarkdownWin" },
        up = { raw = "[u]", rendered = "[󰔵]", highlight = "RenderMarkdownUp" },
        down = { raw = "[d]", rendered = "[󰔳]", highlight = "RenderMarkdownDown" },
      },
    },
    code = {
      style = "full",
      width = "block",
      min_width = 100,
      border = "none",
      conceal_delimiters = false,
      language = false,
      -- Extend the code block background across the opening and closing delimiter rows. Without
      -- this, the delimiters render bare and the block looks like disconnected colored bars.
      -- Added upstream specifically for the visible-backticks use case in
      -- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/643.
      background_inset = 0,
    },
    dash = {
      width = 100,
    },
    quote = {
      icon = "▎",
      repeat_linebreak = true,
    },
    link = {
      enabled = false,
    },
    pipe_table = {
      preset = "round",
    },
    -- Disable rendering inside YAML frontmatter blocks. By default this plugin renders bullets
    -- and wiki links inside frontmatter, which is invalid for our use case. With this disabled,
    -- the frontmatter falls back to standard treesitter YAML syntax highlighting via the
    -- markdown grammar's built-in YAML injection.
    yaml = {
      enabled = false,
    },
  },
}
