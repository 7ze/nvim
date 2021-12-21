-- @core/keymaps.lua --

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- unmapping space and enter
map("n", "<space>", "", opts)
map("n", "<enter>", "", opts)

-- leader key
vim.g.mapleader = " "

-- easy escape
map("i", "jk", "<esc>", opts)
map("i", "jj", "<esc>", opts)
map("i", "kj", "<esc>", opts)

-- explorer
map("n", "<leader>e", ":Lex 17<CR>", opts)

-- move selected line / block of text
map("v", "K", ":move \"<-2<CR>gv-gv", opts)
map("v", "J", ":move \">+1<CR>gv-gv", opts)

-- indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- splits
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>h", ":split<CR>", opts)

-- easy window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- reload
map("n", "<leader>rr", ":luafile %<CR>", opts)
