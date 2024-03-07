local o = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

o.number = true
o.relativenumber = true
o.numberwidth = 2

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true

o.ignorecase = true
o.smartcase = true

o.scrolloff = 10
o.splitright = true
o.splitbelow = true

o.swapfile = false
o.backup = false
o.undofile = true

o.inccommand = 'split' -- show live preview of substitution (:%s/foo/bar/gc)
o.timeoutlen = 300 -- wait time for mapped sequences in ms
o.updatetime = 50 -- longer updatetime leads to noticeable delays

o.mouse = ''
o.wrap = false
o.cursorline = true
o.showmode = false
o.colorcolumn = '80'
o.cmdheight = 1
o.pumheight = 10
o.signcolumn = 'yes'
o.termguicolors = true -- supported by most terminals
o.clipboard = 'unnamedplus' -- access system clipboard

o.list = true -- show tabs and spaces
o.listchars = { eol = '↲', tab = '» ', trail = '·', nbsp = '␣' } -- list tab and trailing characters

-- providers
vim.g.python3_host_prog = vim.fn.stdpath 'config' .. '/.venv/bin/python' -- python 3 provider
vim.g.loaded_perl_provider = 0 -- disabling perl provider
