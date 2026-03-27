local function on_attach(_, bufnr)
    -- Autocomplete using the Lean language server
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Enable lean.nvim, and enable abbreviations and mappings
require('lean').setup({
    mappings = true,
})
vim.lsp.config('leanls', {
    on_attach = on_attach,
})

-- Enable virtual text for Lean
vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.lean",
    callback = function()
        vim.diagnostic.config({ virtual_text = true })
    end,
})

-- Update error messages even while you're typing in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = { spacing = 4 },
        update_in_insert = true,
    }
)
