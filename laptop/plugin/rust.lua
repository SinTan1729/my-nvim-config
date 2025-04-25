vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        enable_clippy = true,
    },
    server = {
        on_attach = function()
            vim.lsp.inlay_hint.enable(true)
        end
    }
}

-- Enable inlay hints for Rust
-- vim.api.nvim_create_autocmd("LspAttach", {
--     pattern = "*.rs",
--     callback = function()
--         vim.lsp.inlay_hint.enable(true)
--     end,
-- })
