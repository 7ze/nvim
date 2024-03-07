return {
  {
    'echasnovski/mini.ai',
    config = function()
      -- better around/inside textobjects
      --
      -- examples:
      -- * va)  - visually select around parentheses
      -- * yinq - yank inside the next quote
      -- * ci'  - change inside the quote
      require('mini.ai').setup { n_lines = 500 }
    end,
  },
  {
    'echasnovski/mini.surround',
    config = function()
      -- add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- examples:
      -- * saiw) - surround add innner word parentheses
      -- * sd'   - surround delete quote
      -- * sr)'  - surround replace parantheses with quote
      require('mini.surround').setup()
    end,
  },
}
