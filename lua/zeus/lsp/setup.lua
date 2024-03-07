require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require 'lspconfig'

local function config(_config)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return vim.tbl_deep_extend('force', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
  }, _config or {})
end

-- servers without additional config
local servers = {
  'ansiblels',
  'bashls',
  'clangd',
  'cssls',
  'dockerls',
  'emmet_ls',
  'gopls',
  'html',
  'htmx',
  'jsonls',
  'lua_ls',
  'marksman',
  'ocamllsp',
  'pyright',
  'ruff_lsp',
  'rust_analyzer',
  'tailwindcss',
  'tsserver',
  'yamlls',
  'zls',
}

for _, server in pairs(servers) do
  lspconfig[server].setup(config())
end

-- servers with additional config
lspconfig.lua_ls.setup(config {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        -- tells lua_ls where to find all the Lua files that you have loaded
        -- for your neovim configuration
        library = {
          '${3rd}/luv/library',
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
        -- if lua_ls is slow, use this:
        -- library = { vim.env.VIMRUNTIME, '${3rd}/luv/library' },
      },
      completion = {
        callSnippet = 'Replace',
      },
      -- in case you want to disable missing fields warning
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
})

lspconfig.html.setup {
  filetypes = { 'html', 'htmldjango' },
}

local ensure_installed = servers
vim.list_extend(ensure_installed, { 'stylua' })
require('mason-tool-installer').setup { ensure_installed = ensure_installed }
