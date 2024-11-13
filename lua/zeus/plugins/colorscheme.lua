return {
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = { transparent_mode = true },
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   opts = {
  --     style = 'night',
  --     transparent = true,
  --     styles = { sidebars = 'transparent', floats = 'transparent' },
  --   },
  -- },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,
          styles = {
            comments = 'italic,bold',
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
          },
        },
      }
    end,
  },
}
