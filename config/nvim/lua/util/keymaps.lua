local M = {}

-- The default way the keys are extracted from the keymap.
local function lazy_vim_keys_function(keymap)
  return keymap[1]
end

-- The default way the keys are extracted from the keymap.
local function neovim_keys_function(keymap)
  return keymap.lhs
end

-- Returns the index of the keys in the keymaps table.
local function find_index(keymaps, keys)
  for index, keymap in ipairs(keymaps) do
    if keymap[1] == keys then
      return index
    end
  end

  return nil
end

-- A helper function that creates a normalized version of two keymaps.
M.normalize_keys = function(keys)
  -- HACK: I couldn't find a way to cleanly set determine the keymap value, so for now I'm
  -- using this hack to ensure the values match. Hopefully, a vim.keymap.get function will
  -- be added at some point.
  return keys:lower():gsub("<leader>", " ")
end

-- Determines if two keymaps match.
M.keys_match = function(first_keys, second_keys)
  return M.normalize_keys(first_keys) == M.normalize_keys(second_keys)
end

-- Searches for a keymap. If the keymap doesn't exist, this function raises an error.
-- @param keymaps An array of keymaps to search.
-- @param keys The keys to match to identiy the keymap.
-- @param keys_function? A function to extract the keys. This defaults to using the first value.
M.find = function(keymaps, keys, keys_function)
  -- Provide a sane default for the keys function.
  keys_function = keys_function or lazy_vim_keys_function

  -- Return the first match.
  return vim.tbl_filter(function(keymap)
    return M.keys_match(keys, keys_function(keymap))
  end, keymaps)[1]
end

-- Searches for a keymap. If the keymap doesn't exist, this function raises an error.
-- @param keymaps An array of keymaps to search.
-- @param keys The keys to match to identiy the keymap.
-- @param keys_function? A function to extract the keys. This defaults to using the first value.
M.find_required = function(keymaps, keys, keys_function)
  -- Provide a sane default for the keys function.
  keys_function = keys_function or lazy_vim_keys_function

  -- Find the value if it exists.
  local match = M.find(keymaps, keys, keys_function)

  -- If the keyamp wasn't found, display an error message.
  if match == nil then
    local keymap_names = vim.tbl_map(function(keymap)
      return "* " .. keys_function(keymap)
    end, keymaps)

    error(
      "The '"
        .. keys
        .. "' keymap could not be found. The available kemaps are: \n\n"
        .. table.concat(keymap_names, "\n")
    )
  end

  -- Return the found keymap.
  return match
end

-- Adds the given keymap to the array of keymaps.
M.add = function(keymaps, keys, action, attributes)
  attributes = attributes or {}

  local keymap = vim.deepcopy(attributes)

  keymap[1] = keys
  keymap[2] = action

  keymaps[#keymaps + 1] = keymap
end

-- Removes the given keymap from the array of keymaps.
M.remove = function(keymaps, keys)
  local index = find_index(keymaps, keys)
  table.remove(keymaps, index)
end

-- Duplicates one of the mappings with a new set of keys.
M.duplicate = function(keymaps, old_keys, new_keys)
  -- Find the old keymap.
  local keymap = vim.deepcopy(M.find_required(keymaps, old_keys))

  -- Add the new keymap.
  M.add(keymaps, new_keys, keymap[2], keymap)
end

-- Given an array of keymaps, this function remaps one of the keymaps.
M.remap = function(keymaps, old_keys, new_keys)
  M.duplicate(keymaps, old_keys, new_keys)
  M.remove(keymaps, old_keys)
end

-- Remaps _all_ of the keymaps with the given prefix.
M.remap_prefix = function(keymaps, old_prefix, new_prefix)
  for _, keymap in pairs(vim.deepcopy(keymaps)) do
    local old_keymap = keymap[1]

    if vim.startswith(old_keymap, "<leader>c") then
      local new_keymap = old_keymap:gsub(old_prefix, new_prefix)
      M.remap(keymaps, old_keymap, new_keymap)
    end
  end
end

-- Remaps a Neovim keymap.
M.remap_nvim = function(mode, old_keys, new_keys, attributes)
  -- Provide a default for the optional attributes.
  attributes = attributes or {}

  -- Find the old keymap.
  local old_keymap = M.find_required(vim.api.nvim_get_keymap(mode), old_keys, neovim_keys_function)

  -- Remove the old keymap.
  vim.keymap.del(mode, old_keys)

  -- Set the new keymap using the old keymap's implementation.
  vim.keymap.set(mode, new_keys, old_keymap.rhs or old_keymap.callback, attributes)
end

return M
