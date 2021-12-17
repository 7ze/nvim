---|| @configs/telescope.lua ||---

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
     mappings = {
       n = {
         ["q"] = actions.close
       },
       i = {
        ["jk"] = { "<esc>", type = "command" },
        ["jj"] = { "<esc>", type = "command" },
        ["kj"] = { "<esc>", type = "command" },
       }
     },
     prompt_prefix = "  ",
     selection_caret = "  ",
     entry_prefix = "  ",
     initial_mode = "insert",
     selection_strategy = "reset",
     sorting_strategy = "ascending",
     layout_strategy = "horizontal",
     layout_config = {
        horizontal = {
           prompt_position = "top",
           preview_width = 0.55,
           results_width = 0.8,
        },
        vertical = {
           mirror = false,
        },
        width = 0.80,
        height = 0.80,
        preview_cutoff = 120,
      },
     file_sorter = require("telescope.sorters").get_fuzzy_file,
     file_ignore_patterns = { "node_modules" },
     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
     path_display = { "truncate" },
     winblend = 0,
     border = {},
     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
     color_devicons = true,
     use_less = true,
     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
     buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')
