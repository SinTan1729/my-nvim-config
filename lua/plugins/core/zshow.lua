return {
    'SinTan1729/zshow.nvim',
    lazy = false,
    config = function()
        vim.keymap.set('n', '<leader>z', require('zshow').open,
            { desc = 'View installed plugins' })
    end,
}
