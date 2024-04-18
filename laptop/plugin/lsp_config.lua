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
        map('n', '<localleader>d', vim.diagnostic.open_float, { remap = false })
    end,
})

-- Enable inlay hints (needs rework after nvim>=0.10)
vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.rs",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
    end,
})
