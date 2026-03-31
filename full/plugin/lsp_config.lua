local map = vim.keymap.set

-- Helper function for LSP configs
local lsp_config = function(server, config)
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        map('n', '<localleader>k', vim.lsp.buf.hover, { remap = false, desc = 'Hover using LSP' })
        map({ 'v', 'n' }, '<localleader>a', require("actions-preview").code_actions,
            { remap = false, desc = 'Preview LSP actions' })
        map('n', '<localleader>f', vim.lsp.buf.definition, { remap = false, desc = 'Jump to definition' })
        map('n', '<localleader>d', vim.diagnostic.open_float, { remap = false, desc = 'Show current diagnostic message' })
        map('n', '<localleader>n', vim.diagnostic.goto_next, { remap = false, desc = 'Go to next diagnostic message' })
        map('n', '<localleader>N', vim.diagnostic.goto_prev,
            { remap = false, desc = 'Go to previous diagnostic message' })
        map("n", "<leader>r", function() return ":IncRename " .. vim.fn.expand("<cword>") end,
            { remap = false, expr = true, desc = 'Rename variable using LSP' })
    end,
})


-- Python
vim.lsp.enable('ty')
lsp_config('ruff', {
    init_options = {
        settings = {
            lineLength = 100,
        }
    }
})

-- Lua
lsp_config('luals', {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    }
})

-- Misc
vim.lsp.enable({ 'bashls', 'gopls', 'hls' })
