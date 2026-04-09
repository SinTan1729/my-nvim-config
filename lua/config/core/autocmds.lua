-- This fine defines all the global auto-commands
local fn = vim.fn
local api = vim.api

api.nvim_create_autocmd('UIEnter', {
    desc = 'Open stuff inside tabs',
    callback = function()
        if fn.argc() > 1 and fn.has('stdin') == 0 then
            vim.schedule(function()
                vim.cmd('tab all')
            end)
        end
    end,
})

api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    callback = function()
        vim.highlight.on_yank({ timeout = 125 })
    end,
})

api.nvim_create_autocmd('BufReadPost', {
    desc = 'Go to last location when opening a buffer',
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
