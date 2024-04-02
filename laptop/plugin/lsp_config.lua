local lspconfig = require('lspconfig')

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
