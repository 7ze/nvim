---|| @configs/lspconfig.lua ||---

-- list of servers to install

local language_servers = {
  'tsserver',
}

-- setting up the servers

for _, server in ipairs(language_servers) do
  require('lspconfig')[server].setup {}
end
