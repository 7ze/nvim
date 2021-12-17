---||  @core/keymaps.lua  ||---


local map = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }


-- unmap <space> and <enter>

map('n', '<enter>', '', opts)
map('n', '<space>', '', opts)


-- leader key

vim.g.mapleader = ' '


-- easy escape

map('i', 'jk', '<esc>', opts)
map('i', 'jj', '<esc>', opts)
map('i', 'kj', '<esc>', opts)


-- explorer

map('n', '<leader>e', ':NvimTreeToggle<cr>', opts)


-- move selected line / block of text

map('v', 'K', ':move \'<-2<CR>gv-gv', opts)
map('v', 'J', ':move \'>+1<CR>gv-gv', opts)


-- indent

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)


-- window split

map('n', '<leader>v', ':vsplit<cr>', opts)
map('n', '<leader>h', ':split<cr>', opts)


-- easy window navigation

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)


-- telescope

map('n', '<leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', opts)
map('n', '<leader>fh', ':Telescope help_tags<cr>', opts)
