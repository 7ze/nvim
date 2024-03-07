return {
  'theprimeagen/harpoon',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    local Remap = require 'zeus.remap'
    local nnoremap = Remap.nnoremap
    local harpoon_ui = require 'harpoon.ui'
    local harpoon_mark = require 'harpoon.mark'

    nnoremap('<leader>a', function()
      harpoon_mark.add_file()
    end, { desc = 'Add file to harpoon' })

    nnoremap('<leader>1', function()
      harpoon_ui.nav_file(1)
    end, { desc = 'Navigate to harpoon file 1' })

    nnoremap('<leader>2', function()
      harpoon_ui.nav_file(2)
    end, { desc = 'Navigate to harpoon file 2' })

    nnoremap('<leader>3', function()
      harpoon_ui.nav_file(3)
    end, { desc = 'Navigate to harpoon file 3' })

    nnoremap('<leader>4', function()
      harpoon_ui.nav_file(4)
    end, { desc = 'Navigate to harpoon file 4' })

    nnoremap('<C-e>', function()
      harpoon_ui.toggle_quick_menu()
    end, { desc = 'Toggle harpoon quick menu' })
  end,
}
