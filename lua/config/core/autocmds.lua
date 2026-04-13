-- This fine defines all the global auto-commands
local api = vim.api

local group = vim.api.nvim_create_augroup('globals', { clear = true })

api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = group,
    callback = function()
        vim.highlight.on_yank({ timeout = 125 })
    end,
})

api.nvim_create_autocmd('BufReadPost', {
    desc = 'Go to last location when opening a buffer',
    group = group,
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

api.nvim_create_autocmd({ 'FileType' }, {
    desc = 'Force commentstring to include spaces',
    group = group,
    callback = function(event)
        local cs = vim.bo[event.buf].commentstring
        vim.bo[event.buf].commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')
    end,
})

api.nvim_create_autocmd({ 'FileType' }, {
    desc = 'Customize commentstring for systemd and caddy',
    group = group,
    pattern = { 'caddy', 'systemd' },
    callback = function(event)
        vim.bo[event.buf].commentstring = '# %s'
    end,
})
