local Remap = require("zeus.map")
local nnoremap = Remap.nnoremap

nnoremap("<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to harpoon" })

nnoremap("<leader>1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to harpoon file 1" })

nnoremap("<leader>2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to harpoon file 2" })

nnoremap("<leader>3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to harpoon file 3" })

nnoremap("<leader>4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Navigate to harpoon file 4" })

nnoremap("<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle harpoon quick menu" })
