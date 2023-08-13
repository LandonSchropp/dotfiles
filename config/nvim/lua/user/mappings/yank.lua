return function(_)
  -- Create more convenient mappings for yanking to and pasting from the system clipboard.
  return {
    n = {
      gy = { '"*y', desc = "Yank to system clipboard" },
      gp = { '"*p', desc = "Paste from system clipboard" },
      gY = { '"*y$', desc = "Yank until end of line to system clipboard" },
    },
    v = {
      gp = { '"*p', desc = "Paste from system clipboard" },
      gy = { '"*y', desc = "Yank to system clipboard" },
    },
  }
end
