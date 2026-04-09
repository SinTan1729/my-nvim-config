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
    end,
}
