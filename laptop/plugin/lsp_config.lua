local lspconfig = require('lspconfig')
local map = vim.keymap.set

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

-- Python
lspconfig.ruff.setup({
    init_options = {
        settings = {
            lineLength = 100,
        }
    }
})
lspconfig.pyright.setup {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
})

-- Misc
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    }
})

lspconfig.ocamllsp.setup {}

lspconfig.hls.setup {}
