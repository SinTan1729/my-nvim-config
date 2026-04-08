return {
    "hrsh7th/nvim-cmp", -- For LSP completion
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
        local cmp = require('cmp')
        return {
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel",
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:CmpDoc,FloatBorder:CmpBorder",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources(
                { { name = "omni" } },
                { { name = 'buffer' } }
            ),
            experimental = { ghost_text = true },
        }
    end,
    config = function(_, opts)
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        cmp.setup(opts)
        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- Insert `(` after select function or method item
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done({
                filetypes = {
                    tex = false
                }
            })
        )
    end,
}
