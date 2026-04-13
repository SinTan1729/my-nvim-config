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

        local arrow_buffer_label = function(name, context)
            local bufnr = context.bufnr
            local path = vim.fn.bufname(bufnr)

            if path == "" then
                return name
            end

            local marks = vim.g.arrow_filenames or {}
            local fullpath = vim.fn.fnamemodify(path, ":p")

            for i, file in ipairs(marks) do
                if vim.fn.fnamemodify(file, ":p") == fullpath then
                    return string.format("%s %s %d", name, '󱡁', i)
                end
            end

            return name
        end

        opts.sections.lualine_c = { 'filename', lua_progress, 'searchcount' }
        opts.tabline.lualine_a = {
            {
                'buffers',
                mode = 2,
                fmt = arrow_buffer_label,
            },
        }

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
