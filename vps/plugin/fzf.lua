local fzf = require("fzf-lua")

-- Default settings for fzf-lua
fzf.setup({
    actions = {
        files = {
            ['default'] = fzf.actions.file_tabedit,
        },
    },
    files = {
        cmd = "rg --files",
    },
})

-- Setup the familiar fzf.nvim commands
fzf.setup_fzfvim_cmds()
