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
            notifier = { enabled = true },
        },
        config = function(_, opts)
            require("snacks").setup(opts)
            -- Override default notify
            vim.notify = require("snacks.notifier").notify
        end,
    },
}
