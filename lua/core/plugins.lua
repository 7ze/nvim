---|| @lua/plugins.lua ||---


-- the following block installs paq manager if not installed already

--[[
-- local fn = vim.fn
-- local install_path = fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
-- end
--]]


-- loads paq-manager

vim.cmd[[packadd paq-nvim]]

local paq = require('paq-nvim').paq


-- list of plugins

paq { 'savq/paq-nvim', opt = true }   -- paq-manger
paq { 'neovim/nvim-lspconfig' }       -- lsp
paq { 'kyazdani42/nvim-tree.lua' }    -- file explorer
paq { 'folke/tokyonight.nvim' }       -- colorscheme
