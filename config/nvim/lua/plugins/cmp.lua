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

    options.mapping["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })

    options.mapping["<s-tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })

    return options
  end,
}
