local set = vim.opt

-- Turn on numbers
set.number = true
-- Turn off line wrapping
set.wrap = false
-- Disable cmdline from bottom
set.cmdheight = 0
-- Ignore case while searching except when the search term contains capital letters
set.ignorecase = true
set.smartcase = true
-- Use 4 spaces and properly adjust them for files using TAB
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
-- Show LSP signs in the number column
set.signcolumn = 'number'
-- Turn on spell checking
set.spell = true
-- Enable mouse support
set.mouse = 'n'
-- Enable programming dictionary
set.spelllang = { "en", "programming" }
-- Use ctrl-[hjkl] to select the active split

-- Disable unused plugins
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0

-- Load UltiSnips snippets from custom-snippets directory
vim.g.UltiSnipsSnippetDirectories = { "custom-snippets", "UltiSnips" }

-- Load keymaps
local keymaps = vim.fn.stdpath("config") .. "/keymaps.lua"
vim.cmd.source(keymaps)

-- Load plugins using paq-nvim
local paq = vim.fn.stdpath("config") .. "/paq.lua"
vim.cmd.source(paq)

