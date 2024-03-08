return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox_dark',
        -- section_separators = '',
        -- component_seperators = '',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    }
  end,
}
