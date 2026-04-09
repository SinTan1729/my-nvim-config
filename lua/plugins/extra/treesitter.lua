return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'hiphish/rainbow-delimiters.nvim' },
    opts = {
        ts_filetypes = { 'rust', 'lua', 'vim', 'vimdoc', 'ocaml',
            'yaml', 'dockerfile', 'bash', 'html', 'javascript', 'css', 'go',
            'json', 'python', 'fish', 'haskell', 'diff' }
    },
}
