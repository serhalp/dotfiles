---@type LazySpec
return {
  -- use mason-tool-installer to configure LSP, DAP, and Formatter/Linter installations
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      ensure_installed = {
        "angular-language-server",
        "astro-language-server",
        "bash-language-server",
        "css-lsp",
        -- FIXME(serhalp) Configure conditional loading for Deno files
        -- "deno",
        "eslint-lsp",
        "html-lsp",
        "lua-language-server",
        "json-lsp",
        "marksman",
        "mdx-analyzer",
        -- TODO(serhalp) Use this instead of `marksman`?
        -- "remark-language-server",
        "python-lsp-server",
        -- FIXME(serhalp) Install fails
        -- "ruby-lsp",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vim-language-server",
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
}
