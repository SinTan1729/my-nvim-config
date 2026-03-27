-- Use moonfly colors in popups
vim.g.moonflyNormalFloat = true

-- Distinguish between the edit and floating windows
vim.o.winborder = "single"

-- Make the background transparent
vim.g.moonflyTransparent = true

-- Display diagnostic virtual text in color
vim.g.moonflyVirtualTextColor = true

--  Use the moonfly colorscheme
vim.cmd.colorscheme('moonfly')

-- Some more setup is inside cmp.lua
