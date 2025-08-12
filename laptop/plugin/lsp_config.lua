local lspconfig = require('lspconfig')
local map = vim.keymap.set
local default_caps = vim.lsp.protocol.make_client_capabilities()
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.tbl_deep_extend("force", default_caps, cmp_caps)

-- ;k to hover
-- ;a to show code actions
-- ;d to show diagnostic message
-- ;n to go to next diagnostic message
-- ;N to go to previous diagnostic message
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        map('n', '<localleader>k', vim.lsp.buf.hover, { remap = false })
        map({ 'v', 'n' }, '<localleader>a', require("actions-preview").code_actions, { remap = false })
        map('n', '<localleader>d', vim.diagnostic.open_float, { remap = false })
        map('n', '<localleader>n', vim.diagnostic.goto_next, { remap = false })
        map('n', '<localleader>N', vim.diagnostic.goto_prev, { remap = false })
    end,
})

-- Python
lspconfig.ruff.setup({
    capabilities = capabilities,
    init_options = {
        settings = {
            lineLength = 100,
        }
    }
})
lspconfig.pyright.setup {
    capabilities = capabilities,
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
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    }
})

lspconfig.gopls.setup({
    capabilities = capabilities,
})
lspconfig.ocamllsp.setup({
    capabilities = capabilities,
})
lspconfig.hls.setup({
    capabilities = capabilities,
})
