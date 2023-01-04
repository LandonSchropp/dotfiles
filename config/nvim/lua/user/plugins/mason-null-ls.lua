-- When configuring Mason for use with null-ls, I've opted to use null-ls as the source of truth.
-- This means the servers listed in the null-ls config will automatically be installed by Mason.
return {
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = false,
}
