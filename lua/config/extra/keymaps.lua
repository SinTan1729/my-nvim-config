-- This file defines all the global keymaps
local map = vim.keymap.set

map('n', '<c-h>', ':wincmd h<cr>', { silent = true, desc = 'Move to split to the left' })
map('n', '<c-j>', ':wincmd j<cr>', { silent = true, desc = 'Move to split below' })
map('n', '<c-k>', ':wincmd k<cr>', { silent = true, desc = 'Move to split above' })
map('n', '<c-l>', ':wincmd l<cr>', { silent = true, desc = 'Move to split to the right' })
