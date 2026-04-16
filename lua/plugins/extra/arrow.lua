return {
    'otavioschwanck/arrow.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    opts = {
        show_icons = true,
        leader_key = "'",            -- Recommended to be a single key
        buffer_leader_key = 'm',     -- Per Buffer Mappings
        index_keys = 'asdfzxcvqwer', -- Use letters for the indices
        mappings = {
            toggle = '/',
        }
    },
    config = function(_, opts)
        require('arrow').setup(opts)

        local group = vim.api.nvim_create_augroup('arrow', { clear = false })
        vim.api.nvim_create_autocmd({ 'BufLeave' }, {
            desc = 'Enable relative line number when leaving arrow buffer',
            group = group,
            callback = function(args)
                if vim.bo[args.buf].buftype ~= '' then
                    vim.schedule(function()
                        vim.opt.relativenumber = true
                    end)
                end
            end,
        })
    end
}
