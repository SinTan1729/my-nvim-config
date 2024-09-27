-- ----------------------------------------------
-- Globals
-- ----------------------------------------------
local set = vim.opt
local g = vim.g
local fn = vim.fn
local map = vim.keymap.set
local api = vim.api
local opt = vim.opt

-- Turn on relative numbers
set.relativenumber = true
-- Turn off line wrapping
set.wrap = false
-- Disable cmdline from bottom
-- set.cmdheight = 0
-- Ignore case while searching except when the search term contains capital letters
set.ignorecase = true
set.smartcase = true
-- Use 4 spaces and properly adjust them for files using TAB,
-- except for Haskell
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local tabsize
        if string.find(" haskell ", ' ' .. vim.bo.filetype .. ' ') then
            tabsize = 2
        else
            tabsize = 4
        end
        set.tabstop = tabsize
        set.shiftwidth = tabsize
        set.softtabstop = tabsize
    end,
})
set.expandtab = true
-- Show LSP signs in the number column
set.signcolumn = 'number'
-- Turn on spell checking
set.spell = true
-- Enable mouse support
set.mouse = 'n'

-- Disable unused plugins
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python_provider = 0

-- ----------------------------------------------
-- Keymaps
-- ----------------------------------------------

-- Change the leader and localleader
g.mapleader = ','
g.maplocalleader = ';'

-- Use ctrl-[hjkl] to select the active split!
map('n', '<c-k>', ":wincmd k<cr>", { silent = true })
map('n', '<c-j>', ":wincmd j<cr>", { silent = true })
map('n', '<c-h>', ":wincmd h<cr>", { silent = true })
map('n', '<c-l>', ":wincmd l<cr>", { silent = true })

-- Use ,dd for deleting without putting into buffer
map({ 'v', 'n' }, '<leader>d', '"_d', { remap = false })
map('n', '<leader>D', '"_D', { remap = false })
map('n', '<leader>x', '"_x', { remap = false })

-- Insert a newline in normal mode by ,o and ,O
map('n', '<leader>o', ":<c-u>call append(line('.'), repeat([''], v:count1))<cr>", { remap = false })
map('n', '<leader>O', ":<c-u>call append(line('.')-1, repeat([''], v:count1))<cr>", { remap = false })

-- Use ,u for redo
map('n', '<leader>u', "<c-r>", { remap = false })

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
map('n', '<leader>f', ':Files<cr>', { remap = false })
