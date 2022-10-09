local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { ".git/", "%.pdf", "%.ttf", "%.otf", "%.mkv", "%.mp4", "%.zip" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-h>"] = "which_key",
      },
      n = {
        ["<C-c>"] = actions.close
      }
    }
  }
}

local M = {};

M.search_dotfiles = function ()
  require("telescope.builtin").find_files({
    prompt_title = "<dots/>",
    cwd = "~/dots/",
    hidden = true,
  })
end

return M
