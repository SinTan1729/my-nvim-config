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

dr_map('n', '<leader>d', '"_d', { remap = false, desc = 'Delete without putting into buffer' })
map('v', '<leader>d', '"_d', { remap = false, desc = 'Delete line without putting into buffer' })
dr_map('n', '<leader>D', '"_D', { remap = false, desc = 'Delete rest of line without putting into buffer' })
dr_map('n', '<leader>x', '"_x', { remap = false, desc = 'Delete character without putting into buffer' })
dr_map('n', '<leader>c', '"_viwP', { remap = false, desc = 'Replace without putting into buffer' })

map('n', '<leader>o', ":<c-u>call append(line('.'), repeat([''], v:count1))<cr>",
    { remap = false, desc = 'Insert a newline below' })
map('n', '<leader>O', ":<c-u>call append(line('.')-1, repeat([''], v:count1))<cr>",
    { remap = false, desc = 'Insert a newline above' })

-- Browser like keymaps
map('n', '<leader>j', "gT", { remap = false, desc = 'Go to previous tab' })
map('n', '<leader>k', "gt", { remap = false, desc = 'Go to next tab' })
map('n', '<leader>w', ":bdelete<cr>", { remap = false, desc = 'Close tab' })
map('n', '<leader>W', ":bdelete!<cr>", { remap = false, desc = 'Force close tab' })
map('n', '<leader>t', ":tabnew<cr>", { remap = false, desc = 'Open tab' })
map('n', '<leader>q', ":qa<cr>", { remap = false, desc = 'Close nvim' })
map('n', '<leader>Q', ":qa!<cr>", { remap = false, desc = 'Force close nvim' })
map('n', '<leader>s', ":w<cr>", { remap = false, desc = 'Save current file' })
map('n', '<leader>S', ":x<cr>", { remap = false, desc = 'Save current file and exit nvim' })

map('n', '<leader>u', "<c-r>", { remap = false, desc = 'Redo' })
map('n', '<Esc>', ':noh<cr>', { remap = false, desc = 'Remove search highlights' })
map('n', '<leader>f', ':Files<cr>', { remap = false, desc = 'Find files using fzf', silent = true })
