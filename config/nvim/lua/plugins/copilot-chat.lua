---@module "lazy"

---@type LazySpec
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    show_help = "yes",
    debug = false,
    disable_extra_info = "no",
  },
  build = function()
    vim.notify(
      "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    )
  end,
  event = "VeryLazy",
  keys = {
    {
      "<Leader>cb",
      ":CopilotChatBuffer ",
      desc = "Chat with current buffer",
    },
    { "<Leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
    { "<Leader>ct", "<cmd>CopilotChatTests<cr>",   desc = "Generate tests" },
    {
      "<Leader>cT",
      "<cmd>CopilotChatVsplitToggle<cr>",
      desc = "Toggle vertical split",
    },
    {
      "<Leader>cv",
      ":CopilotChatVisual ",
      mode = "x",
      desc = "Open vertical split",
    },
    {
      "<Leader>cx",
      ":CopilotChatInPlace<cr>",
      mode = "x",
      desc = "Run in-place code",
    },
    {
      "<Leader>cf",
      "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
      desc = "Fix diagnostic",
    },
    {
      "<Leader>cr",
      "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
      desc = "Reset chat and buffer",
    },
  },
}
