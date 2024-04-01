local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            telemetry = { enable = false },
        },
    }
})
