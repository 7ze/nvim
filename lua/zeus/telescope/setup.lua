local actions = require 'telescope.actions'
local action_layout = require 'telescope.actions.layout'
local themes = require 'telescope.themes'

require('telescope').setup {
  defaults = {
    prompt_prefix = '    ',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.7,
        results_width = 0.5,
      },
      width = 0.7,
      height = 0.7,
    },
    file_ignore_patterns = { '.git/', '%.pdf', '%.ttf', '%.otf', '%.mkv', '%.mp4', '%.zip', 'node_modules' },
    winblend = 15,
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-u>'] = false, -- clears prompt
        ['<M-p>'] = action_layout.toggle_preview, -- toggle preview
        ['<C-h>'] = actions.which_key,
      },
      n = {
        ['q'] = actions.close,
        ['<C-c>'] = actions.close,
        ['<M-p>'] = action_layout.toggle_preview, -- toggle preview
      },
    },
    extensions = {
      ['ui-select'] = { themes.get_dropdown() },
    },
  },
  pickers = {
    buffers = {
      theme = 'dropdown',
      previewer = false,
      layout_config = {
        prompt_position = 'bottom',
      },
      mappings = {
        i = {
          ['<C-d>'] = actions.delete_buffer,
        },
        n = {
          ['<d-d>'] = actions.delete_buffer,
        },
      },
    },
    find_files = {
      hidden = true,
    },
    help_tags = {
      mappings = {
        i = {
          ['<CR>'] = actions.select_vertical,
        },
        n = {
          ['<CR>'] = actions.select_vertical,
        },
      },
    },
    live_grep = {
      additional_args = function()
        return { '--hidden' }
      end,
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
