-- This file defines all the global auto-commands
local api = vim.api
local set_l = vim.opt_local
local set = vim.opt

local group = vim.api.nvim_create_augroup('globals', { clear = false })

-- Custom tab sizes for filetypes
local tab_widths = {
    { pattern = { 'haskell', 'javascript', 'css', 'html' }, width = 2 },
    { pattern = { 'markdown' },                             width = 3 },
}
for _, cfg in ipairs(tab_widths) do
    vim.api.nvim_create_autocmd('FileType', {
        desc = string.format('Set %d-space tabs for %s', cfg.width,
            table.concat(cfg.pattern, ', ')),
        group = group,
        pattern = cfg.pattern,
        callback = function()
            set_l.tabstop = cfg.width
            set_l.shiftwidth = 0
            set_l.softtabstop = -1
        end,
    })
end

api.nvim_create_autocmd('FileType', {
    desc = 'Do not expand tabs using spaces inside Makefiles',
    group = group,
    pattern = 'make',
    callback = function()
        set_l.expandtab = false
    end,
})

api.nvim_create_autocmd('FileType', {
    desc = 'Auto wrap text in text-like files',
    group = group,
    pattern = { 'text', 'markdown', 'tex' },
    callback = function()
        set_l.textwidth = 140
        set_l.formatoptions:append('tcq')
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Auto compile and load custom dictionaries',
    group = group,
    pattern = '*',
    callback = function()
        local spell_dir = vim.fn.stdpath('data') .. '/site/spell'
        local dict_dir = vim.fn.stdpath('config') .. '/spell'
        local files = vim.fn.glob(dict_dir .. '/*.utf-8.add', false, true)

        for _, file in ipairs(files) do
            local name = file:match('.*/([a-z%-]+)%.utf%-8%.add$')
            local spl = spell_dir .. '/' .. name .. '.utf-8.spl'
            local add = dict_dir .. '/' .. name .. '.utf-8.add'

            local add_time = vim.fn.getftime(add)
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
