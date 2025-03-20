-- This file lists all the global keymaps
local map = vim.keymap.set
local g = vim.g

-- Change the leader and localleader
g.mapleader = ','
g.maplocalleader = ';'

-- Make a dot-repeatable keymap
local function dr_map(mode, motion, keycodes, opts)
    local termcodes = vim.api.nvim_replace_termcodes(keycodes, true, true, true)
    local function dot_repeatable()
        _G.dot_repeat_callback = vim.api.nvim_feedkeys(termcodes, mode, false)
        vim.go.operatorfunc = 'v:lua.dot_repeat_callback'
        return 'g@l'
    end
    map(mode, motion, dot_repeatable, opts)
end

-- Use ,dd for deleting without putting into buffer etc.
dr_map('n', '<leader>d', '"_d', { remap = false })
map('v', '<leader>d', '"_d', { remap = false })
dr_map('n', '<leader>D', '"_D', { remap = false })
dr_map('n', '<leader>x', '"_x', { remap = false })
dr_map('n', '<leader>r', '"_viwP', { remap = false })

-- Insert a newline in normal mode by ,o and ,O
map('n', '<leader>o', ":<c-u>call append(line('.'), repeat([''], v:count1))<cr>", { remap = false })
map('n', '<leader>O', ":<c-u>call append(line('.')-1, repeat([''], v:count1))<cr>", { remap = false })

-- Use ,u for redo
map('n', '<leader>u', "<c-r>", { remap = false })

-- Find files using fzf by ,f
map('n', '<leader>f', ":Files<cr>", { remap = false })

-- Browser like keymaps
map('n', '<leader>k', ":tabnext<cr>", { remap = false })
map('n', '<leader>j', ":tabprevious<cr>", { remap = false })
map('n', '<leader>w', ":bdelete<cr>", { remap = false })
map('n', '<leader>W', ":bdelete!<cr>", { remap = false })
map('n', '<leader>t', ":tabnew<cr>", { remap = false })
map('n', '<leader>q', ":qa<cr>", { remap = false })
map('n', '<leader>Q', ":qa!<cr>", { remap = false })
map('n', '<leader>s', ":w<cr>", { remap = false })
map('n', '<leader>S', ":x<cr>", { remap = false })

-- Clear search highlight by Esc in normal mode
map('n', '<Esc>', ':noh<cr>', { remap = false })

-- Find files using fzf by ,f
map('n', '<leader>f', ':Files<cr>', { remap = false, silent = true })
