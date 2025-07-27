-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec

-- TODO(serhalp) I have no idea what I'm doing here, but I imagine there's a
-- more neovim/lua-native way to define these helpers.
vim.api.nvim_create_user_command("CopyCurBufAbsPathToClipboard", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
vim.api.nvim_create_user_command("CopyCurBufRelPathToClipboard", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = false,
        guifont = "Inconsolata Nerd Font Mono",
        textwidth = 100,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      -- second key is the lefthand side of the map

      -- tables with just a `desc` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      -- ["<Leader>b"] = { desc = "Buffers" },

      -- setting a mapping to false will disable it
      -- ["<C-S>"] = false,

      n = {
        ["<Tab>"] = { "<Esc>" },
        ["Q"] = { "gq" },

        -- "Chordless" keys to move between windows
        ["gj"] = { "<C-w>j" },
        ["gk"] = { "<C-w>k" },
        ["gh"] = { "<C-w>h" },
        ["gl"] = { "<C-w>l" },

        -- Copy current filename to system clipboard
        ["<Leader>f"] = { "<cmd>CopyCurBufRelPathToClipboard<cr>", desc = "Copy buffer rel. path to clipboard" },
        ["<Leader>F"] = { "<cmd>CopyCurBufAbsPathToClipboard<cr>", desc = "Copy buffer abs. path to clipboard" },

        -- Move a line of text around with Alt+j/Alt+k
        ["<M-j>"] = { "mz:m+<cr>`z" },
        ["<M-k>"] = { "mz:m-2<cr>`z" },

        -- Toggle file explorer (tree-sitter) with current file focused
        ["<Leader>E"] = { "<cmd>Neotree focus reveal<cr>", desc = "Toggle Explorer w/ file focused" },
      },
      v = {
        ["<Tab>"] = { "<Esc>gV" },

        -- Move selected lines around with Alt+j/Alt+k
        ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z" },
        ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z" },
      },
      o = {
        ["<Tab>"] = { "<Esc>" },
      },
      i = {
        ["<Tab>"] = { "<Esc>`^" },

        -- Some basic readline mappings in insert mode
        ["<C-A>"] = { "<Home>" },
        ["<C-E>"] = { "<End>" },
        ["<C-K>"] = { "<C-U>" },
      },
      t = {
      },
    },
  },
}
