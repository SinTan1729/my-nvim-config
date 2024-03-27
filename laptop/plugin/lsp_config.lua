local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            telemetry = { enable = false },
        },
    }
})

lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy",
            }
        },
    },
}
