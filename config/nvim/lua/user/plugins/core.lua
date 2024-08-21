return {
  { "max397574/better-escape.nvim", enabled = false },
  { "windwp/nvim-autopairs",        enabled = false },
  {
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

      return opts
    end,
  },
  {
    "racarriga/nvim-notify",
    opts = {
      background_colour = "#000000"
    }
  }
}
