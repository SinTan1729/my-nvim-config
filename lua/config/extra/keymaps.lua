-- This file lists all the global keymaps
local map = vim.keymap.set

map('n', '<c-h>', ':wincmd h<cr>', { remap = false, silent = true, desc = 'Move to split to the left' })
map('n', '<c-j>', ':wincmd j<cr>', { remap = false, silent = true, desc = 'Move to split below' })
map('n', '<c-k>', ':wincmd k<cr>', { remap = false, silent = true, desc = 'Move to split above' })
map('n', '<c-l>', ':wincmd l<cr>', { remap = false, silent = true, desc = 'Move to split to the right' })

map('n', '<leader>y', '"+y', { remap = false, desc = 'Copy to system clipboard' })
map('n', '<leader>p', '"+p', { remap = false, desc = 'Paste from system clipboard' })
