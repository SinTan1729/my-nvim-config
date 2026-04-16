-- This file defines all the global configs
local set = vim.opt
local g = vim.g
local diag = vim.diagnostic
local sev = diag.severity

set.termguicolors = true
-- Turn on numbers
set.number = true
-- Turn off line wrapping
set.wrap = false
-- Disable cmdline from bottom
set.cmdheight = 0

-- Use 4 spaces and properly adjust them for files using TAB
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 0
set.softtabstop = -1

-- Set a color column
set.textwidth = 100
set.colorcolumn = '+1'
-- Fancy status bar
set.signcolumn = 'yes:1'
set.statuscolumn = '%l%s'
diag.config({
    signs = {
        text = {
            [sev.ERROR] = "",
            [sev.WARN]  = "",
            [sev.INFO]  = "",
            [sev.HINT]  = "󰌵",
        },
    },
})
-- Ignore case while searching except when the search term contains capital letters
set.ignorecase = true
set.smartcase = true
-- Turn on spell checking
set.spell = true
set.spelllang = { 'en' }

-- Enable mouse support
set.mouse = 'n'

-- Disable unused plugins
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

vim.filetype.add({
    extension = {
        caddy = 'caddy',
        -- podman quadlets
        container = 'systemd',
        network = 'systemd',
        pod = 'systemd',
        kube = 'systemd',
        volume = 'systemd',
        -- Needed for gopls
        tmpl = 'gotmpl',
        work = 'gowork',
    },
    filename = {
        ['Caddyfile'] = 'caddy',
    },
    pattern = {
        -- backup_script configs
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.entry'] = 'bash',
        ['${XDG_CONFIG_HOME}/backup_config/.*/.*%.config'] = 'bash',
    },
})
