return {
  "folke/noice.nvim",
  enabled = false,
  opts = {
    routes = {
      {
        filter = { event = "msg_show", kind = "search_count" },
        opts = { skip = true },
      },
    },
  },
}
