---@module "lazy"

-- Switch between source and alternative files, such as a module and its test.
---@type LazySpec
return {
  "rgroli/other.nvim",
  main = "other-nvim",
  cmd = { "Other", "OtherTabNew", "OtherSplit", "OtherVSplit" },
  opts = {
    -- Only offer files that exist, so a single real match opens directly instead of showing a
    -- picker alongside its nonexistent sibling candidates.
    showMissingFiles = false,

    mappings = {
      -- TypeScript tests are co-located with their source files.
      { pattern = "(.*)/([^.]*)%.ts$", target = "%1/%2.test.ts", context = "test" },
      { pattern = "(.*)/(.*)%.test%.ts$", target = "%1/%2.ts", context = "source" },

      -- Ruby specs live in a spec directory mirroring lib (gems) or app (Rails).
      { pattern = "lib/(.*)%.rb$", target = "spec/%1_spec.rb", context = "spec" },
      { pattern = "app/(.*)%.rb$", target = "spec/%1_spec.rb", context = "spec" },
      {
        pattern = "spec/(.*)_spec%.rb$",
        target = {
          { target = "lib/%1.rb", context = "source" },
          { target = "app/%1.rb", context = "source" },
        },
      },
    },
  },
}
