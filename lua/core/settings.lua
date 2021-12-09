---||  @lua/settings.lua  ||---


-- colorscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_transparent_sidebar = true
vim.cmd[[ colorscheme tokyonight ]]


-- other settings
vim.o.ignorecase = true
vim.o.expandtab = true   -- convert tabs to spaces
vim.o.list = true        -- show invisible characters
vim.wo.rnu = true        -- relative numbers
