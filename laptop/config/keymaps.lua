-- This file lists all the global keymaps
local map = vim.keymap.set
local g = vim.g
local api = vim.api
local opt = vim.opt

-- Change the leader and localleader
g.mapleader = ','
g.maplocalleader = ';'

-- Set K to hover
api.nvim_buf_create_user_command(0, "LspHover", "lua vim.lsp.buf.hover()", { nargs = '+' })
opt.keywordprg = ":LspHover"

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
map('n', '<leader>o', ":call append(line('.'), '')<cr>", { remap = false })
map('n', '<leader>O', ":call append(line('.')-1, '')<cr>", { remap = false })

-- Use ,u for redo
map('n', '<leader>u', "<c-r>", { remap = false })

-- Browser like keymaps
map('n', '<leader>k', ":bnext<cr>", { remap = false })
map('n', '<leader>j', ":bprevious<cr>", { remap = false })
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
vim.keymap.set('n', '<leader>f', ':Files<cr>', { remap = false, silent = true })
