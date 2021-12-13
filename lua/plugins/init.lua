---|| @plugins/init.lua ||---

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- loads packer
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
function(use)
  -- packer
  use { 'wbthomason/packer.nvim', opt = true }

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- lsp
  use { 'neovim/nvim-lspconfig' }

  -- treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  -- treesitter playground
  use { 'nvim-treesitter/playground' }

  -- telescope
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
    }

  -- colorschemes
  use { 'folke/tokyonight.nvim' }
end)
