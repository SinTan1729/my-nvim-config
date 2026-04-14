-- This file defines all the global config
local set = vim.opt
local g = vim.g
local fn = vim.fn

-- Customize inccommand
set.cmdwinheight = 10
set.inccommand = 'split'

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")
