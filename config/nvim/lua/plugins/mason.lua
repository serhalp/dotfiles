---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "angularls",
        "astro",
        "bashls",
        "cssls",
        -- FIXME(serhalp) Configure conditional loading for Deno files
        -- "denols",
        "eslint",
        "html",
        "lua_ls",
        "jsonls",
        "marksman",
        "mdx_analyzer",
        -- TODO(serhalp) Use this instead of `marksman`?
        -- "remark_ls",
        "pylsp",
        -- FIXME(serhalp) Install fails
        -- "ruby_lsp",
        "svelte",
        "tailwindcss",
        "ts_ls",
        "vimls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- FIXME(serhalp) Configure conditional loading for Biome projects
        -- "biome",
        -- FIXME(serhalp) Conditionally enable commitlint
        -- "commitlint",
        "prettier",
        "shellcheck",
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {},
    },
  },
}
