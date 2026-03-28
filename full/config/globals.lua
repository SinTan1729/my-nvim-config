-- This file defines all the global config
local set = vim.opt
local set_l = vim.opt_local
local g = vim.g
local fn = vim.fn
local api = vim.api

-- Open stuff inside tab
api.nvim_create_autocmd("UIEnter", {
    callback = function()
        if fn.argc() > 1 and fn.has("stdin") == 0 then
            vim.schedule(function()
                vim.cmd("tab all")
            end)
        end
    end,
})

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

-- Use 4 spaces and properly adjust them for files using TAB, with some exceptions
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 0
set.softtabstop = -1
api.nvim_create_autocmd("FileType", {
    pattern = { "haskell", "javascript" },
    callback = function()
        set_l.tabstop = 2
    end,
})
api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        set_l.expandtab = false
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
set.spellfile = fn.stdpath("config") .. "/config/custom-dict.utf-8.add"

-- Disable unused plugins
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")

-- Treat some files as systemd
vim.filetype.add({
    extension = {
        caddy = 'caddy',
        -- podman quadlets
        container = 'systemd',
        network = 'systemd',
        pod = 'systemd',
        kube = 'systemd',
        volume = 'systemd',
    },
    filename = {
        Caddyfile = 'caddy',
    },
    pattern = {
        -- backup_script configs
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.entry'] = 'bash',
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.config'] = 'bash',
    },
})

-- Auto wrap text in text-like files
api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown", "tex" },
    callback = function()
        set_l.textwidth = 140
        set_l.formatoptions:append("tcq")
    end,
})
