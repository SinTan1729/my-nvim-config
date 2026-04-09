-- This file defines all the global config
local set = vim.opt
local g = vim.g
local fn = vim.fn

-- Customize inccommand
set.cmdwinheight = 10
set.inccommand = 'split'

-- Show LSP signs in the number column
set.signcolumn = 'number'

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")

local spell_dir = vim.fn.stdpath('data') .. '/site/spell'
-- Temporary shim needed for academic.nvim and nvim-ts-autotag
fn['spellfile#WritableSpellDir'] = function()
    fn.mkdir(spell_dir, 'p')
    return spell_dir
end
