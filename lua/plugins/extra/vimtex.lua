return {
    "lervag/vimtex",
    init = function()
        -- Use zathura with vimtex, the zathura_simple one makes synctex work in Wayland
        vim.g.vimtex_view_method = 'zathura_simple'
        -- Use a temporary directory for aux files
        vim.g.vimtex_compiler_latexmk = { aux_dir = "/tmp/latexmk" }
    end,
    config = function()
        vim.api.nvim_create_autocmd(
            'FileType', {
                desc = "Compile LaTeX once by ;lo and also add proper line-breaking",
                pattern = 'tex',
                group = vim.api.nvim_create_augroup("vimrc_tex", {}),
                callback = function()
                    vim.keymap.set("n", "<localleader>lo", ":silent VimtexCompileSS<cr>",
                        { buffer = true, remap = false, desc = "Compile LaTeX once" })
                end,
            }
        )
    end,
}
