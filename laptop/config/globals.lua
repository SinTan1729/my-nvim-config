-- This file defines all the global config
local set = vim.opt
local g = vim.g
local fn = vim.fn

-- Turn on numbers
set.number = true
-- Turn off line wrapping
-- set.wrap = false
-- Disable cmdline from bottom
set.cmdheight = 0
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
-- Enable programming dictionary
set.spelllang = { "en", "programming" }

-- Disable unused plugins
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")
