-- Load old vimrc first
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Load plugins using vim-plug
local plug = vim.fn.stdpath("config") .. "/plug.vim"
vim.cmd.source(plug)

-- Default settings for comment plugin
require('Comment').setup()

