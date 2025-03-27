local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {
--         check = {
--             command = "clippy",
--         }
--     },
--   },
-- }

-- ;k to hover
-- ;a to show code actions
-- ;d to show diagnostic message
-- ;n to go to next diagnostic message
-- ;N to go to previous diagnostic message
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        map('n', '<localleader>k', vim.lsp.buf.hover, { remap = false })
        map('n', '<localleader>a', vim.lsp.buf.code_action, { remap = false })
        map('n', '<localleader>d', vim.diagnostic.open_float, { remap = false })
        map('n', '<localleader>n', vim.diagnostic.goto_next, { remap = false })
        map('n', '<localleader>N', vim.diagnostic.goto_prev, { remap = false })
    end,
})
