return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'hiphish/rainbow-delimiters.nvim' },
    opts = {
        ts_filetypes = { 'lua', 'vim', 'vimdoc', 'yaml', 'dockerfile', 'bash', 'json', 'python', 'fish', 'diff',
            'rust', 'ocaml', 'html', 'javascript', 'css', 'go', 'haskell' }
    },
}
