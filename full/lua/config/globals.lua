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
set.cmdwinheight = 10
set.inccommand = 'split'
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
set.spelllang = { "en" }
-- The custom dicts are not committed to the GitHub repo for obvious reasons
set.spellfile = fn.stdpath("config") .. "/dicts/custom-dict.utf-8.add"

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

-- Ensure that the binary spl file is up-to-date with the source add file
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local config_path = vim.fn.stdpath("config") -- Get Neovim's config path
        local add_file = config_path .. "/config/custom-dict.utf-8.add"
        local spl_file = config_path .. "/config/custom-dict.utf-8.add.spl"

        if vim.fn.filereadable(add_file) == 1 then
            local add_mtime = vim.fn.getftime(add_file) -- Get modification time of .add file
            local spl_mtime = vim.fn.getftime(spl_file) -- Get modification time of .add.spl file

            -- Run mkspell! only if .add is newer than .add.spl or .add.spl doesn't exist
            if (add_mtime > spl_mtime) or (spl_mtime == -1) then
                vim.cmd("silent! mkspell! " .. spl_file .. " " .. add_file)
            end
        end
    end,
})
