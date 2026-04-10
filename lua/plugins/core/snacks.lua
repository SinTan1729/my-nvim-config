return {
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
        require('snacks').setup(opts)
        -- Override default notify
        vim.notify = require('snacks.notifier').notify
        vim.api.nvim_create_user_command('Logs', function(opts1)
            require('snacks.notifier').show_history({
                filter = opts1.args ~= '' and opts1.args or nil,
            })
        end, {
            nargs = '?',
            desc = 'Show notification history, with optional filter',
        })
    end,
}
