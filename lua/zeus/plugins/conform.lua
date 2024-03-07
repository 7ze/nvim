return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      go = { 'goimports', 'gofmt' },
      lua = { 'stylua' },
      python = { 'ruff_format' },
      javascript = { { 'prettierd', 'prettier' } },
    },
  },
}
