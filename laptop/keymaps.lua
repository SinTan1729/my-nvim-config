-- This file lists all the global keymaps

-- Change the leader and localleader
vim.g.mapleader = ','
vim.g.maplocalleader = ';'

-- Set K to hover
vim.cmd[[command -nargs=+ LspHover lua vim.lsp.buf.hover()]]
vim.opt.keywordprg = ":LspHover"

-- Use ctrl-[hjkl] to select the active split!
vim.keymap.set('n', '<c-k>', ":wincmd k<cr>", { silent = true })
vim.keymap.set('n', '<c-j>', ":wincmd j<cr>", { silent = true })
vim.keymap.set('n', '<c-h>', ":wincmd h<cr>", { silent = true })
vim.keymap.set('n', '<c-l>', ":wincmd l<cr>", { silent = true })

-- Use ,dd for deleting without putting into buffer
vim.keymap.set({ 'v', 'n' }, '<leader>d', '"_d', { remap = false })
vim.keymap.set('n', '<leader>D', '"_D', { remap = false })
vim.keymap.set('n', '<leader>x', '"_x', { remap = false })

-- Insert a newline in normal mode by ,o
vim.keymap.set('n', '<leader>o', "o<Esc>k", { remap = false })
vim.keymap.set('n', '<leader>O', "O<Esc>j", { remap = false })

-- Use ,u for redo
vim.keymap.set('n', '<leader>u', "<c-r>", { remap = false })

-- Find files using fzf by ,f
vim.keymap.set('n', '<leader>f', ":Files<cr>", { remap = false })

-- Move around buffers using ,j and ,k
vim.keymap.set('n', '<leader>k', ":bnext<cr>", { remap = false })
vim.keymap.set('n', '<leader>j', ":bprevious<cr>", { remap = false })

