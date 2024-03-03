local Remap = require("zeus.map")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>fh", builtin.help_tags, { desc = "find help tags" })
nnoremap("<leader>fk", builtin.keymaps, { desc = "find keymaps" })
nnoremap("<leader>ff", builtin.find_files, { desc = "find files" })
nnoremap("<leader>fg", builtin.live_grep, { desc = "find by grep" })
nnoremap("<leader>fs", builtin.grep_string, { desc = "find current word under cursor" })
-- nnoremap("<leader>fd", builtin.diagnostics, { desc = "search diagnostics" })

nnoremap("<leader>/", function()
	require("zeus.telescope").current_buffer_fuzzy_find()
end, { desc = "live grep with telesecope" })

nnoremap("<leader>fd", function()
	require("zeus.telescope").search_dotfiles()
end, { desc = "search dotfiles" })

nnoremap("<leader>fn", function()
	require("zeus.telescope").search_nvim_config()
end, { desc = "search nvim config" })

nnoremap("<leader>fw", function()
	require("zeus.telescope").set_wallpaper()
end, { desc = "set wallpaper" })
