-- This file defines all the global keymaps
local map = vim.keymap.set

map('n', '<c-h>', ':wincmd h<cr>', { silent = true, desc = 'Move to split to the left' })
map('n', '<c-j>', ':wincmd j<cr>', { silent = true, desc = 'Move to split below' })
map('n', '<c-k>', ':wincmd k<cr>', { silent = true, desc = 'Move to split above' })
map('n', '<c-l>', ':wincmd l<cr>', { silent = true, desc = 'Move to split to the right' })

map('n', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
