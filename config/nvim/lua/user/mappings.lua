-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    ["<Tab>"] = { "<Esc>" },
    ["Q"] = { "gq" },

    -- "Chordless" keys to move between windows
    ["gj"] = { "<C-w>j" },
    ["gk"] = { "<C-w>k" },
    ["gh"] = { "<C-w>h" },
    ["gl"] = { "<C-w>l" },

    -- Copy current filename to system clipboard
    ["<leader>f"] = { "let @* = expand(\"%%\")<CR>" },

    -- Move a line of text around with Alt+j/Alt+k
    ["<M-j>"] = { "mz:m+<cr>`z" },
    ["<M-k>"] = { "mz:m-2<cr>`z" },
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
}
