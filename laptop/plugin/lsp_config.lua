local lspconfig = require('lspconfig')
local map = vim.keymap.set

require 'lspconfig'.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            telemetry = { enable = false },
        },
    }
})

-- Set ;k to hover and ;a to show code actions
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        map('n', '<localleader>k', vim.lsp.buf.hover, { remap = false })
        map('n', '<localleader>a', vim.lsp.buf.code_action, { remap = false })
    end,
})
