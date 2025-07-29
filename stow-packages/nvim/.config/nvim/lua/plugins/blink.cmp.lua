local blink = require "blink.cmp"

---@type LazySpec
return {
  "Saghen/blink.cmp",
  opts = {
    keymap = { -- Mappings are defined in the keymap table
      -- I use Ctrl-Space at the OS level
      ["<C-Space>"] = false,
      -- Unnecessary and potentially confusing
      ["<C-y>"] = false,
      -- Unnecessary and potentially confusing
      ["<C-e>"] = false,
      -- Incompatible with my using <Tab> for <Esc>
      ["<Tab>"] = false,
      ["<S-Tab>"] = false,
    },
  },
}
