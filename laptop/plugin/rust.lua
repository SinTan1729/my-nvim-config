vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                check = {
                    command = "clippy"
                }
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
