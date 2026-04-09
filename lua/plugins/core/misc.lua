return {
    -- Some miscellaneous plugins
    { 'sairyy/zshow.nvim',       lazy = false },
    { 'sitiom/nvim-numbertoggle' },
    { 'kylechui/nvim-surround',  opts = {} },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            notifier = {
                enabled = true,
                top_down = false,
                margin = { top = 1, right = 1, bottom = 1 },
            },
        },
        config = function(_, opts)
            require("snacks").setup(opts)
            -- Override default notify
            vim.notify = require("snacks.notifier").notify
        end,
    },
}
