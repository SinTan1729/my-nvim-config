local lspconfig = require('lspconfig')
local map = vim.keymap.set

lspconfig.pyright.setup({
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

lspconfig.ocamllsp.setup {}

lspconfig.hls.setup {}

-- Set ;k to hover and ;a to show code actions
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        map('n', '<localleader>k', vim.lsp.buf.hover, { remap = false })
        map('n', '<localleader>a', vim.lsp.buf.code_action, { remap = false })
        map('n', '<localleader>d', vim.diagnostic.open_float, { remap = false })
    end,
})

-- Enable inlay hints for Rust
vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.rs",
    callback = function()
        vim.lsp.inlay_hint.enable(true)
    end,
})
