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
        -- TODO(serhalp) Configure conditional loading for Biome projects
        -- "biome",
        -- TODO(serhalp) Conditionally enable commitlint
        -- "commitlint",
        "css-lsp",
        -- FIXME(serhalp) Configure conditional loading for Deno files
        -- "deno",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "mdx-analyzer",
        "prettier",
        "python-lsp-server",
        -- TODO(serhalp) Use this instead of `marksman`?
        -- "remark-language-server",
        "ruby-lsp",
        "shellcheck",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vim-language-server",
      },
    },
  },
}
