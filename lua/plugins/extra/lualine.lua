return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'linrongbin16/lsp-progress.nvim',
        'otavioschwanck/arrow.nvim',
    },
    opts = function(_, opts)
        local lua_progress = function()
            return require('lsp-progress').progress()
        end

        local function arrow_status() -- from lualine documentation
            return require('arrow.statusline').text_for_statusline_with_icons()
        end

        opts.sections.lualine_c = { 'filename', lua_progress, 'searchcount' }
        opts.tabline.lualine_y = { arrow_status }

        return opts
    end,
    config = function(_, opts)
        require('lualine').setup(opts)
        local group = vim.api.nvim_create_augroup('lualine', { clear = true })
        vim.api.nvim_create_autocmd('User', {
            desc = 'Update lualine progress',
            group = group,
            pattern = 'LspProgressStatusUpdated',
            callback = require('lualine').refresh,
        })
    end,
}
