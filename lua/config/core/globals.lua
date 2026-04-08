-- This file defines all the global configs
local set = vim.opt
local g = vim.g
local fn = vim.fn

-- Open stuff inside tab
vim.api.nvim_create_autocmd("UIEnter", {
    desc = "Open stuff inside tabs",
    callback = function()
        if fn.argc() > 1 and fn.has("stdin") == 0 then
            vim.schedule(function()
                vim.cmd("tab all")
            end)
        end
    end,
})

set.termguicolors = true
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
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 0
set.softtabstop = -1
-- Turn on spell checking
set.spell = true
-- Enable mouse support
set.mouse = 'n'
-- Enable programming dictionary
set.spelllang = { "en" }

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

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 125 })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Go to last loc when opening a buffer",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
