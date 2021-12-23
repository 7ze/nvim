-- @plugins/init.lua --

-- bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer..."
  vim.cmd [[ packadd packer.nvim ]]
end

-- autocmd to run packer.sync() whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
-- exits if packer cannot be invoked
if not status_ok then
  vim.notify "Packer could not be loaded!"
  return
end

-- custom initialization
packer.init {
  display = {
    open_fn = require("packer.util").float, -- An optional function to open a floating window for packer
    working_sym = "⚙️" , -- The symbol for a plugin being installed/updated
    error_sym = "🧨", -- The symbol for a plugin with an error in installation/updating
    done_sym = "🎉", -- The symbol for a plugin which has completed installation/updating
    removed_sym = "🔥", -- The symbol for an unused plugin which was removed
    moved_sym = "🚀", -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = "━", -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = "double", -- Border style of prompt popups.
  },
}

local use = packer.use
packer.reset()

packer.startup(function()
  -- plugins
  use "wbthomason/packer.nvim" -- have packer manage itself

  -- completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- automatically sets up plugins after bootstrap
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)

