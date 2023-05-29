-- Add the <tab> and <s-tab> keymappings as specified in the nvim-cmp documentation.
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, options)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
          == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local default = require("cmp.config.default")()

    options.mapping["<tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })

    options.mapping["<s-tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" })

    -- Override the sources to customize the ordering and include additional sources.
    options.sources = cmp.config.sources({
      { name = "copilot" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    })

    -- Override the sorting algorithm so that copilot suggestions are prioritized.
    -- https://github.com/zbirenbaum/copilot-cmp#comparators
    options.sorting = {
      comparators = {
        require("copilot_cmp.comparators").prioritize,
        unpack(default.sorting.comparators),
      },
    }

    return options
  end,
}
