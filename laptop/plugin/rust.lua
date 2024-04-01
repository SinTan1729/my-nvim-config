vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set(
                "n",
                "<localleader>a",
                function()
                    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                end,
                { silent = true, buffer = bufnr, noremap = true }
            )
        end,
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
