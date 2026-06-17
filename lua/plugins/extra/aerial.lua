return {
    'stevearc/aerial.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        layout = {
            min_width = 30,
            placement = 'edge',
        },
        close_automatic_events = { 'unsupported' },
        on_attach = function(bufnr)
            local map = vim.keymap.set
            map('n', '<localleader>{', '<cmd>AerialPrev<CR>',
                { buf = bufnr, desc = 'Jump to previous item on Aerial' })
            map('n', '<localleader>}', '<cmd>AerialNext<CR>',
                { buf = bufnr, desc = 'Jump to next item on Aerial' })
            map('n', '<leader>a', '<cmd>AerialToggle!<CR>',
                { desc = 'Toggle Aerial bar' })
        end,
    },
}
