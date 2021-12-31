-- @core/options.lua --

local o = vim.o

o.nu = true                                                  -- set numberline
o.rnu = true                                                 -- set relative numberline
o.mouse = "a"                                                -- enables mouse
o.path = o.path .. "**"                                      -- enable recursive search in cmd using find
o.expandtab = true                                           -- convert tabs to spaces
o.tabstop = 2                                                -- set tab length
o.softtabstop = 2                                            -- set tab length
o.shiftwidth = 2                                             -- set indent length
o.list = true                                                -- show tabs and spaces
o.numberwidth = 2
o.cursorline = true
o.cmdheight = 2
o.showmode = false
o.ignorecase = true                                          -- ignore case when searching
o.termguicolors = true                                       -- supported by most terminals
o.clipboard = "unnamedplus"                                  -- access system clipboard
o.completeopt = "menu,menuone,noselect"                      -- for completion
o.listchars = "eol:↲,tab:>-,trail:-,extends:>,precedes:<"    -- list newline and trailing characters

