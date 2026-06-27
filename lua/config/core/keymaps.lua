-- This file defines all the global keymaps
local map = vim.keymap.set
local g = vim.g

-- Change the leader and localleader
g.mapleader = ','
g.maplocalleader = ';'

-- Make dot-repeatable keymaps
local current_dr_op
_G.__dr_dispatch = function()
    current_dr_op()
end
local function dr_map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.expr = true
    local termcodes = vim.api.nvim_replace_termcodes(rhs, true, true, true)
    local op = function()
        local count = vim.v.count1
        local keys = (count > 1 and tostring(count) or '') .. termcodes
        vim.api.nvim_feedkeys(keys, 'n', false)
    end
    vim.keymap.set(mode, lhs, function()
        current_dr_op = op
        vim.go.operatorfunc = 'v:lua.__dr_dispatch'
        return 'g@l'
    end, opts)
end

dr_map('n', '<leader>d', '"_d', { desc = 'Delete without putting into buffer' })
map('v', '<leader>d', '"_d', { desc = 'Delete line without putting into buffer' })
dr_map('n', '<leader>D', '"_D', { desc = 'Delete rest of line without putting into buffer' })
dr_map('n', '<leader>x', '"_x', { desc = 'Delete character without putting into buffer' })
dr_map('n', '<leader>c', '"_c', { desc = 'Replace without putting into buffer' })

dr_map('n', '<leader>o', ":<c-u>call append(line('.'), repeat([''], v:count1))<cr>",
    { desc = 'Insert a newline below' })
dr_map('n', '<leader>O', ":<c-u>call append(line('.')-1, repeat([''], v:count1))<cr>",
    { desc = 'Insert a newline above' })

-- Browser like keymaps
map('n', '<leader>j', ':bprevious<cr>', { desc = 'Go to previous buffer' })
map('n', '<leader>k', ':bnext<cr>', { desc = 'Go to next buffer' })
map('n', '<leader>w', ':bdelete<cr>', { desc = 'Close buffer' })
map('n', '<leader>W', ':bdelete!<cr>', { desc = 'Force close buffer' })
map('n', '<leader>t', ':enew<cr>', { desc = 'Open buffer' })
map('n', '<leader>q', ':qa<cr>', { desc = 'Close nvim' })
map('n', '<leader>Q', ':qa!<cr>', { desc = 'Force close nvim' })
map('n', '<leader>s', ':w<cr>', { desc = 'Save current file' })
map('n', '<leader>S', ':x<cr>', { desc = 'Save current file and exit nvim' })
map('n', '<leader>x', ':ccl<cr>', { desc = 'Close quickfix' })

map('n', '<leader>u', '<c-r>', { desc = 'Redo' })
map('n', '<Esc>', ':noh<cr>', { desc = 'Remove search highlights' })
