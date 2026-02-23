-- -- Enable languagetool support using YaLafi
-- vim.g.tex_flavor = "latex"
-- vim.g.vimtex_grammar_vlty = {
--     lt_command = 'languagetool',
--     show_suggestions = 1,
--     language = 'en_us',
--     shell_options = ' --packages "*" --equation-punctuation display'
-- }

-- Compile once by ;lo and also add proper line-breaking
vim.api.nvim_create_autocmd(
    'FileType', {
        desc = 'Compile once by <localleader>lo and also add proper line-breaking',
        pattern = 'tex',
        group = vim.api.nvim_create_augroup('vimrc_tex', {}),
        callback = function()
            vim.keymap.set('n', '<localleader>lo', ":silent VimtexCompileSS<cr>",
                { buffer = true, desc = 'Compile LaTeX once' })
            vim.opt.linebreak = true
            vim.opt.tw = 140
        end,
    }
)

-- Use zathura with vimtex, the zathura_simple one makes synctex work in Wayland
vim.g.vimtex_view_method = 'zathura_simple'

-- Use a temporary directory for aux files
vim.g.vimtex_compiler_latexmk = { aux_dir = "/tmp/latexmk" }
