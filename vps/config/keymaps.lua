-- This file lists all the global keymaps
local map = vim.keymap.set
local g = vim.g

-- Change the leader and localleader
g.mapleader = ','
g.maplocalleader = ';'

-- Use ,dd for deleting without putting into buffer
map({ 'v', 'n' }, '<leader>d', '"_d', { remap = false })
map('n', '<leader>D', '"_D', { remap = false })
map('n', '<leader>x', '"_x', { remap = false })

-- Insert a newline in normal mode by ,o
map('n', '<leader>o', "o<Esc>k", { remap = false })
map('n', '<leader>O', "O<Esc>j", { remap = false })

-- Use ,u for redo
map('n', '<leader>u', "<c-r>", { remap = false })

-- Find files using fzf by ,f
map('n', '<leader>f', ":Files<cr>", { remap = false })

-- Buffer related keymaps
map('n', '<leader>k', ":bnext<cr>", { remap = false })
map('n', '<leader>j', ":bprevious<cr>", { remap = false })
map('n', '<leader>w', ":bdelete<cr>", { remap = false })

-- Clear search highlight by Esc in normal mode
map('n', '<Esc>', ':noh<cr>', { remap = false })

-- Find files using fzf by ,f
vim.keymap.set('n', '<leader>f', ':Files<cr>', { remap = false, silent = true })
