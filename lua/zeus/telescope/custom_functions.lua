local themes = require 'telescope.themes'
local builtin = require 'telescope.builtin'
local M = {}

local function set_background(content)
  print(content)
  vim.fn.system('setbg ' .. content)
end

local function select_background(prompt_bufnr, map)
  local function set_the_background(close)
    local content = require('telescope.actions.state').get_selected_entry()
    set_background(content.cwd .. '/' .. content.value)
    if close then
      require('telescope.actions').close(prompt_bufnr)
    end
  end

  map('i', '<C-p>', function()
    set_the_background()
  end)

  map('i', '<CR>', function()
    set_the_background(true)
  end)
end

local function image_selector(prompt, cwd)
  return function()
    builtin.find_files(themes.get_dropdown {
      previewer = false,
      prompt_title = prompt,
      cwd = cwd,
      attach_mappings = function(prompt_bufnr, map)
        print 'Choose your wallie!!'
        select_background(prompt_bufnr, map)
        return true
      end,
    })
  end
end

M.current_buffer_fuzzy_find = function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    prompt_title = '< Fuzzy search in current buffer />',
    layout_config = {
      width = 0.7,
      height = 0.6,
    },
    winblend = 10,
    previewer = false,
  })
end

M.search_dotfiles = function()
  builtin.find_files(themes.get_ivy {
    prompt_title = '< dotfiles />',
    cwd = '~/dots/',
    hidden = true,
  })
end

M.search_nvim_config = function()
  builtin.find_files(themes.get_ivy {
    prompt_title = '< neovim config />',
    prompt_position = 'bottom',
    cwd = '~/.config/nvim/',
    hidden = true,
  })
end

M.set_wallpaper = image_selector('< Choose your wallie /> ', '~/media/pix/wallpapers/')

return M
