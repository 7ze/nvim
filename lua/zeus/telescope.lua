local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    prompt_prefix = "   ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.7,
        results_width = 0.6,
      },
      width = 0.7,
      height = 0.9,
    },
    file_ignore_patterns = { ".git/", "%.pdf", "%.ttf", "%.otf", "%.mkv", "%.mp4", "%.zip", "node_modules" },
    winblend = 7,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-h>"] = "which_key",
      },
      n = {
        ["<C-c>"] = actions.close,
        ["q"] = actions.close,
      }
    }
  }
}

local M = {};

M.search_dotfiles = function ()
  require("telescope.builtin").find_files({
    prompt_title = "< dots />",
    cwd = "~/dots/",
    hidden = true,
  })
end

M.search_nvim_config = function ()
  require("telescope.builtin").find_files({
    prompt_title = "< neovim config />",
    cwd = "~/.config/nvim/",
    hidden = true,
  })
end

return M
