local Remap = require("zeus.map")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ff", ":Telescope find_files<cr>")
nnoremap("<leader>fg", ":Telescope live_grep<cr>")
nnoremap("<leader>fb", ":Telescope file_browser<cr>")
nnoremap("<leader>fh", ":Telescope help_tags<cr>")

nnoremap("<leader>fd", function()
  require("zeus.telescope").search_dotfiles()
end)

nnoremap("<leader>fn", function()
  require("zeus.telescope").search_nvim_config()
end)

nnoremap("<leader>fw", function()
  require("zeus.telescope").set_wallpaper()
end)
