-- Load old vimrc first
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Load plugins using vim-plug
local paq = vim.fn.stdpath("config") .. "/paq.lua"
vim.cmd.source(paq)

-- Default settings for comment plugin
require('Comment').setup()

