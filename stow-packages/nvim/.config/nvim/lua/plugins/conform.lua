local oxfmt_with_fallback = { "oxfmt", lsp_format = "fallback" }

---@type LazySpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = oxfmt_with_fallback,
      javascriptreact = oxfmt_with_fallback,
      typescript = oxfmt_with_fallback,
      typescriptreact = oxfmt_with_fallback,
      vue = oxfmt_with_fallback,
      svelte = oxfmt_with_fallback,
      astro = oxfmt_with_fallback,
      json = oxfmt_with_fallback,
      jsonc = oxfmt_with_fallback,
      css = oxfmt_with_fallback,
      scss = oxfmt_with_fallback,
      html = oxfmt_with_fallback,
      markdown = oxfmt_with_fallback,
      graphql = oxfmt_with_fallback,
      yaml = oxfmt_with_fallback,
    },
  },
}
