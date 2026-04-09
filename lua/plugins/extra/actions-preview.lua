return {
    'aznhe21/actions-preview.nvim',
    dependencies = {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = function(_, opts)
            opts.picker = { enabled = true }
            opts.bigfile = { enabled = true }
            opts.dashboard = {
                enabled = true,
                sections = {
                    { section = 'header' },
                    { section = 'keys',  gap = 1, padding = 1 },
                },
            }
            return opts
        end,
    },
}
