local Remap = require("zeus.map")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


-- unmapping space and enter
nmap("<space>", "<nop>")
nmap("<enter>", "<nop>")

-- easy escape
inoremap("jk", "<esc>")
inoremap("jj", "<esc>")
inoremap("kj", "<esc>")

-- explorer
nnoremap("<leader>e", ":Lex 12<cr>")

-- move selected line / block of text
vnoremap("K", ":move \'<-2<cr>gv-gv")
vnoremap("J", ":move \'>+1<cr>gv-gv")

-- indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- splits
nnoremap("<leader>v", ":vsplit<cr>")
nnoremap("<leader>h", ":split<cr>")

-- easy window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- resize with arrows
nnoremap("<C-up>", ":resize +2<cr>")
nnoremap("<C-down>", ":resize -2<cr>")
nnoremap("<C-left>", ":vertical resize -2<cr>")
nnoremap("<C-right>", ":vertical resize +2<cr>")

-- navigate buffers
nnoremap("<S-l>", ":bnext<cr>")
nnoremap("<S-h>", ":bprevious<cr>")

-- close buffers
nnoremap("<leader>bd", ":bd<cr>")

-- reload
nnoremap("<leader>r", ":so %<cr>")

-- centers cursor during motion
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- save and quit
nnoremap("<leader>w", ":w<cr>")
nnoremap("<leader>q", ":q<cr>")

-- misc
nnoremap("<leader>ss", "<cmd>silent !slock<cr>")
nnoremap("<leader>u", ":UndotreeToggle<cr>")
nnoremap("<leader>x", "<cmd>silent !chmod +x %<cr>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")
