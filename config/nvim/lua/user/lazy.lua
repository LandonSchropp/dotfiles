return {
  -- Disable lazy loading of plugins. The plugins don't take very long to load, and this prevents
  -- issues where plugins are not loaded when they need to be.
  defaults = { lazy = false },
}
