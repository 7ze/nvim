-- bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone",
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
    autocmd BufWritePost lua/zeus/packer.lua source <afile> | PackerSync
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
        open_fn = require("packer.util").float,
        working_sym = "⚙️",
        error_sym = "",
        done_sym = "",
        removed_sym = "",
        moved_sym = "🚀",
        header_sym = "━",
        show_all_info = true,
        prompt_border = "double",
    },
}

local use = packer.use
packer.reset()

packer.startup(function()
    -- plugins
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

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

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use "nvim-telescope/telescope-file-browser.nvim"

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- misc
    use "mbbill/undotree"
    use "ThePrimeagen/harpoon"
    use "ThePrimeagen/vim-be-good"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"

    -- automatically sets up plugins after bootstrap
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
