local Remap = require("zeus.map")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap 
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


-- unmapping space and enter
nmap("<space>", "<nop>")
nmap("<enter>", "<nop>")

-- leader key
vim.g.mapleader = " "

-- easy escape
inoremap("jk", "<esc>")
inoremap("jj", "<esc>")
inoremap("kj", "<esc>")

-- explorer
nnoremap("<leader>e", ":Lex 12<CR>")

-- move selected line / block of text
vnoremap("K", ":move \'<-2<CR>gv-gv")
vnoremap("J", ":move \'>+1<CR>gv-gv")

-- indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- splits
nnoremap("<leader>v", ":vsplit<CR>")
nnoremap("<leader>h", ":split<CR>")

-- easy window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- resize with arrows
nnoremap("<C-up>", ":resize +2<CR>")
nnoremap("<C-down>", ":resize -2<CR>")
nnoremap("<C-left>", ":vertical resize -2<CR>")
nnoremap("<C-right>", ":vertical resize +2<CR>")

-- navigate buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- reload
nnoremap("<leader>rr", ":luafile %<CR>")

-- centers cursor during motion
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
