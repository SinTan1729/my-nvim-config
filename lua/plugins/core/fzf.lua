return {
    'ibhagwan/fzf-lua',
    opts = function()
        local fzf = require('fzf-lua')
        return {
            actions = {
                files = {
                    ['default'] = fzf.actions.file_tabedit,
                },
            },
        }
    end,
    config = function(_, opts)
        local fzf = require('fzf-lua')
        fzf.setup(opts)
        -- Setup the familiar fzf.nvim commands
        fzf.setup_fzfvim_cmds()
        vim.keymap.set('n', '<leader>f', fzf.files,
            { remap = false, silent = true, desc = 'Find files using fzf' })
    end,
}
