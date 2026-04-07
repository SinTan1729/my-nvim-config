return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "micangl/cmp-vimtex",
        "f3fora/cmp-spell",
        "quangnguyen30192/cmp-nvim-ultisnips",
    },
    opts = function(_, opts)
        local cmp = require("cmp") ---@type any
        -- Add snippet support
        opts.snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        }

        -- Override sources, merging is more hassle that it's worth
        -- rebuild sources cleanly
        opts.sources = cmp.config.sources(
            {
                { name = "nvim_lsp" },
                { name = "omni" },
                { name = "vimtex" },
                { name = "ultisnips" },
                {
                    name = "spell",
                    option = {
                        enable_in_context = function()
                            return not vim.lsp.buf_is_attached()
                                or require("cmp.config.context").in_treesitter_capture("spell")
                        end,
                        preselect_correct_word = false,
                    },
                }
            },
            { { name = 'buffer' } }
        )

        return opts
    end,
}
