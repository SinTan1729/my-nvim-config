-- This fine defines all the global auto-commands
local api = vim.api

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
