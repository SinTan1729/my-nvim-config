return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'micangl/cmp-vimtex' },
        { 'f3fora/cmp-spell' },
        { 'quangnguyen30192/cmp-nvim-ultisnips' },
    },
    opts = function(_, opts)
        -- Add snippet support
        opts.snippet = {
            expand = function(args)
                vim.fn['UltiSnips#Anon'](args.body)
            end,
        }

        -- Some extra completion sources
        local extra_primary = {
            { name = 'nvim_lsp' },
            { name = 'vimtex' },
            { name = 'ultisnips' },
            {
                name = 'spell',
                option = {
                    enable_in_context = function()
                        return not vim.lsp.buf_is_attached()
                            or require('cmp.config.context').in_treesitter_capture('spell')
                    end,
                    preselect_correct_word = false,
                },
            }
        }

        opts.raw_sources = {
            table.move(opts.raw_sources[1], 1, #opts.raw_sources[1], #extra_primary + 1, extra_primary),
            opts.raw_sources[2] or { { name = "buffer" } },
        }

        return opts
    end,
}
