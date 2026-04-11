return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'hiphish/rainbow-delimiters.nvim' },
    opts = function(_, opts)
        local extra_filetypes = { 'rust', 'ocaml', 'html', 'javascript', 'css',
            'go', 'haskell' }
        table.move(extra_filetypes, 1, #extra_filetypes, #opts.ts_filetypes + 1, opts.ts_filetypes)
        return opts
    end,
}
