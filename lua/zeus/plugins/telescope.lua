return { -- Fuzzy Finder (files, lsp, etc.)
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    require 'zeus.telescope.setup'
    require 'zeus.telescope.custom_functions'

    local Remap = require 'zeus.remap'
    local builtin = require 'telescope.builtin'
    local nnoremap = Remap.nnoremap

    nnoremap('<leader>fh', builtin.help_tags, { desc = 'find help tags' })
    nnoremap('<leader>fk', builtin.keymaps, { desc = 'find keymaps' })
    nnoremap('<leader>ff', builtin.find_files, { desc = 'find files' })
    nnoremap('<leader>fs', builtin.grep_string, { desc = 'find current string under cursor' })
    nnoremap('<leader>fg', builtin.live_grep, { desc = 'find by grep' })
    nnoremap('<leader><leader>', builtin.buffers, { desc = 'find buffers' })
    nnoremap('<leader>fe', builtin.diagnostics, { desc = 'search diagnostics' })

    nnoremap('<leader>/', function()
      require('zeus.telescope.custom_functions').current_buffer_fuzzy_find()
    end, { desc = 'fuzzy search in current buffer' })

    nnoremap('<leader>fd', function()
      require('zeus.telescope.custom_functions').search_dotfiles()
    end, { desc = 'search dotfiles' })

    nnoremap('<leader>fn', function()
      require('zeus.telescope.custom_functions').search_nvim_config()
    end, { desc = 'search nvim config' })

    nnoremap('<leader>fw', function()
      require('zeus.telescope.custom_functions').set_wallpaper()
    end, { desc = 'set wallpaper' })
  end,
}
