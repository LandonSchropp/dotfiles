return {
  "rgroli/other.nvim",
  name = "other-nvim",
  event = "VeryLazy",
  opts = {
    showMissingFiles = true,
    rememberBuffers = true,
    mappings = {
      -- Ruby on Rails
      {
        pattern = "/app/(.*)%.rb$",
        target = "/spec/%1_spec.rb",
        context = "test",
      },
      {
        pattern = "/spec/(.*)_spec%.rb$",
        target = "/app/%1.rb",
        context = "implementation",
      },

      {
        pattern = "/lib/(.*)%.rb$",
        target = "/spec/lib/%1_spec.rb",
        context = "test",
      },
      {
        pattern = "/spec/lib/(.*)_spec%.rb$",
        target = "/lib/%1.rb",
        context = "implementation",
      },

      {
        pattern = "/backend/packs/(.*)/app/(.*)%.rb$",
        target = "/backend/packs/%1/spec/%2_spec.rb",
        context = "test",
      },
      {
        pattern = "/backend/packs/(.*)/app_public/(.*)%.rb$",
        target = "/backend/packs/%1/spec/%2_spec.rb",
        context = "test",
      },

      -- JavaScript/TypeScript
      -- TODO: Choose a style (co-location vs. separate directories) based upon the folders in the
      -- source directory.
      {
        pattern = "/(.*)%.([jt]sx?)$",
        target = "/%1.test.%2",
        context = "test",
      },
      {
        pattern = "/(.*)%.test%.([jt]sx?)$",
        target = "/%1.%2",
        context = "implementation",
      },
    },
    style = {
      border = "rounded",
      newFileIndicator = "(Doesn't Exist)",
    },
  },
  config = true,
  keys = {
    { "<Leader>Fa", "<cmd>Other<cr>", desc = "Alternate file" },
  },
}
