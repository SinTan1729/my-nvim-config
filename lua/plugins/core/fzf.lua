return {
    'ibhagwan/fzf-lua',
    opts = function()
        local fzf = require('fzf-lua')
        return {
            actions = {
                files = {
                    ['default'] = fzf.actions.file_edit,
                },
            },
        }
    end,
    config = function(_, opts)
        local fzf = require('fzf-lua')
        local map = vim.keymap.set
        fzf.setup(opts)
        -- Setup the familiar fzf.nvim commands
        fzf.setup_fzfvim_cmds()
        map('n', '<leader>f', fzf.files,
            { remap = false, silent = true, desc = 'Find files using fzf' })
        map('n', '<leader>b', fzf.buffers,
            { remap = false, desc = 'Search buffers and go' })
        map('n', '<leader>g', fzf.live_grep_native,
            { remap = false, desc = 'Live grep the current project' })
    end,
}
