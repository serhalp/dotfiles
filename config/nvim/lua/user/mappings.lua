-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

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
  n = {
    ["<Tab>"] = { "<Esc>" },
    ["Q"] = { "gq" },

    -- "Chordless" keys to move between windows
    ["gj"] = { "<C-w>j" },
    ["gk"] = { "<C-w>k" },
    ["gh"] = { "<C-w>h" },
    ["gl"] = { "<C-w>l" },

    -- Copy current filename to system clipboard
    ["<leader>f"] = { "<cmd>CopyCurBufRelPathToClipboard<cr>", desc = "Copy buffer rel. path to clipboard" },
    ["<leader>F"] = { "<cmd>CopyCurBufAbsPathToClipboard<cr>", desc = "Copy buffer abs. path to clipboard" },

    -- Move a line of text around with Alt+j/Alt+k
    ["<M-j>"] = { "mz:m+<cr>`z" },
    ["<M-k>"] = { "mz:m-2<cr>`z" },

    -- Toggle file explorer (tree-sitter) with current file focused
    ["<leader>E"] = { "<cmd>Neotree focus reveal<cr>", desc = "Toggle Explorer w/ file focused" },

    -- Project-wide find-and-replace via Spectre
    ["<leader>fg"] = { "<cmd>lua require(\"spectre\").toggle()<CR>", desc = "Find and replace in all files" },

  },
  v = {
    ["<Tab>"] = { "<Esc>gV" },

    -- Move selected lines around with Alt+j/Alt+k
    ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z" },
    ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z" },

    -- Project-wide find-and-replace via Spectre
    ["<leader>fg"] = { "<esc><cmd>lua require(\"spectre\").open_visual()<CR>", desc = "Find and replace highlighted string in all files" },
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
