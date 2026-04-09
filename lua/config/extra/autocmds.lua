-- This fine defines all the global auto-commands
local api = vim.api
local set_l = vim.opt_local
local set = vim.opt

-- Custom tab sizes for filetypes
api.nvim_create_autocmd('FileType', {
    desc = 'Haskell and JS should have 2 space tabs',
    pattern = { 'haskell', 'javascript' },
    callback = function()
        set_l.tabstop = 2
    end,
})
api.nvim_create_autocmd('FileType', {
    desc = 'Do not expand tabs using saces inside Makefiles',
    pattern = 'make',
    callback = function()
        set_l.expandtab = false
    end,
})

api.nvim_create_autocmd('FileType', {
    desc = 'Auto wrap text in tex-like files',
    pattern = { 'text', 'markdown', 'tex' },
    callback = function()
        set_l.textwidth = 140
        set_l.formatoptions:append('tcq')
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Auto compile and load custom dictionaries',
    pattern = '*',
    callback = function()
        local spell_dir = vim.fn.stdpath('data') .. '/site/spell'
        local dict_dir = vim.fn.stdpath('config') .. '/spell'
        local files = vim.fn.glob(dict_dir .. '/*.utf-8.add', false, true)

        for _, file in ipairs(files) do
            local name = file:match('.*/([a-z%-]+)%.utf%-8%.add$')
            local spl = spell_dir .. '/' .. name .. 'utf-8.spl'
            local add = dict_dir .. '/' .. name .. '.utf-8.add'

            local add_time = vim.fn.getftime(file)
            local spl_time = vim.fn.getftime(spl)

            if vim.fn.filereadable(add) == 1
                and (spl_time == -1 or add_time > spl_time)
            then
                vim.cmd('silent! mkspell! ' .. spell_dir .. '/' .. name .. ' ' .. add)
            end
            set.spelllang:append(name)
        end
    end,
})
