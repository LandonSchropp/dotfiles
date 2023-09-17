return {
  settings = {
    diagnostics = {
      -- Disable the "File is a CommonJS module" error. This error is annoying because it's applied
      -- to configuration files that are required to be CommonJS modules.
      ignoredCodes = { 80001 },
    },
  },
}
