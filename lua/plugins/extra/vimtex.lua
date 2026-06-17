return {
    'lervag/vimtex',
    init = function()
        local g = vim.g
        -- Use zathura with vimtex, the zathura_simple one makes synctex work in Wayland
        g.vimtex_view_method = 'zathura_simple'
        -- Use a temporary directory for aux files
        g.vimtex_compiler_latexmk = { aux_dir = '/tmp/latexmk' }
        g.vimtex_quickfix_method = 'pplatex'
    end,
    config = function()
        local group = vim.api.nvim_create_augroup('latex-lsp', { clear = true })
        vim.api.nvim_create_autocmd(
            'FileType', {
                desc = 'Compile LaTeX once by ;lo',
                group = group,
                pattern = 'tex',
                callback = function(args)
                    vim.keymap.set('n', '<localleader>lo', ':silent VimtexCompileSS<cr>',
                        { buf = args.buf, desc = 'Compile current LaTeX file once' })
                end,
            }
        )
    end,
}
