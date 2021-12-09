---|| @lsp/servers.lua ||---

-- LSP servers to install

local language_servers = {
  'tsserver',
}

for _, server in ipairs(language_servers) do
  require('lspconfig')[server].setup {}
end
