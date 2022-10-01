local o = vim.o

o.number = true
o.relativenumber = true
o.numberwidth = 2

o.mouse = "a"
o.wrap = false
o.cursorline = true
o.showmode = false

o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.ignorecase = true
o.smartcase = true

o.cmdheight = 1
o.pumheight = 10
o.scrolloff = 10
o.splitright = true
o.splitbelow = true

o.swapfile = false
o.backup = false
o.undofile = true

o.timeoutlen = 700                                           -- wait time for mapped sequences in ms
o.updatetime = 50                                            -- longer updatetime leads to noticeable delays

o.signcolumn = "yes"
o.termguicolors = true                                       -- supported by most terminals
o.path = o.path .. "**"                                      -- enable recursive search in cmd using find
o.clipboard = "unnamedplus"                                  -- access system clipboard
o.completeopt = "menu,menuone,noselect"                      -- completion

o.list = true                                                -- show tabs and spaces
o.listchars = "eol:↲,tab:>-,trail:-,extends:>,precedes:<"    -- list newline and trailing characters