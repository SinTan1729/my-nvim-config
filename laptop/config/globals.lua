-- Open stuff inside tab
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        if vim.fn.argc() > 1 and vim.fn.has("stdin") == 0 then
            vim.schedule(function()
                vim.cmd("tab all")
            end)
        end
    end,
})

-- This file defines all the global config
local set = vim.opt
local set_l = vim.opt_local
local g = vim.g
local fn = vim.fn

-- Turn on colors
set.termguicolors = true
-- Turn on numbers
set.number = true
-- Turn on line wrapping
set.wrap = false
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
        if string.find(" haskell javascript ", ' ' .. vim.bo.filetype .. ' ') then
            tabsize = 2
        else
            tabsize = 4
        end
        if string.find(" make ", ' ' .. vim.bo.filetype .. ' ') then
            set_l.expandtab = false
        else
            set_l.expandtab = true
        end
        set_l.tabstop = tabsize
        set_l.shiftwidth = tabsize
        set_l.softtabstop = tabsize
    end,
})
-- Show LSP signs in the number column
set.signcolumn = 'number'
-- Turn on spell checking
set.spell = true
-- Enable mouse support
set.mouse = 'n'
-- Enable programming dictionary
set.spelllang = { "en", "programming", "en-academic" }
set.spellfile = vim.fn.stdpath("config") .. "/config/custom-dict.utf-8.add"

-- Disable unused plugins
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")

vim.filetype.add({
    extension = {
        -- podman quadlets
        container = 'systemd',
        network = 'systemd',
        pod = 'systemd',
        kube = 'systemd',
        volume = 'systemd',
    },
    pattern = {
        -- backup_script configs
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.entry'] = 'bash',
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.config'] = 'bash',
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown", "tex" },
    callback = function()
        set_l.textwidth = 140
        set_l.formatoptions:append("tcq")
    end,
})
