local cmp = require "cmp"

---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- I use Ctrl-Space at the OS level
    opts.mapping["<C-Space>"] = nil
    -- Unnecessary and potentially confusing
    opts.mapping["<C-y>"] = nil
    -- Unnecessary and potentially confusing
    opts.mapping["<C-e>"] = nil
    -- Incompatible with my using <Tab> for <Esc>
    opts.mapping["<Tab>"] = nil
    opts.mapping["<S-Tab>"] = nil

    -- Map <M-Tab> for basic completion trigger
    opts.mapping["<M-Tab>"] = cmp.mapping.complete()

    return opts
  end,
}
