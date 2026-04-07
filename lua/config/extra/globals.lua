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

-- Customize inccommand
set.cmdwinheight = 10
set.inccommand = 'split'

-- Custom tab sizes for filetypes
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

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")

-- Auto wrap text in text-like files
api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown", "tex" },
    callback = function()
        set_l.textwidth = 140
        set_l.formatoptions:append("tcq")
    end,
})

local spell_dir = vim.fn.stdpath("data") .. "/site/spell"
-- Temporary shim needed for academic.nvim and nvim-ts-autotag
vim.fn["spellfile#WritableSpellDir"] = function()
    vim.fn.mkdir(spell_dir, "p")
    return spell_dir
end

-- Auto compile custom dictionaries and load them
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local dict_dir = vim.fn.stdpath("config") .. "/spell"
        local files = vim.fn.glob(dict_dir .. "/*.utf-8.add", false, true)
        for _, file in ipairs(files) do
            local name = file:match(".*/([a-z%-]+)%.utf%-8%.add$")
            local spl = spell_dir .. "/" .. name .. "utf-8.spl"
            local add = dict_dir .. "/" .. name .. ".utf-8.add"

            local add_time = vim.fn.getftime(file)
            local spl_time = vim.fn.getftime(spl)

            if vim.fn.filereadable(add) == 1
                and (spl_time == -1 or add_time > spl_time)
            then
                vim.cmd("silent! mkspell! " .. spell_dir .. "/" .. name .. " " .. add)
            end
            set.spelllang:append(name)
        end
    end,
})
