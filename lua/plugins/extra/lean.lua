return {
    'julian/lean.nvim',
    opts = {
        mappings = true,
    },
    config = function(_, opts)
        local function on_attach(_, bufnr)
            -- Autocomplete using the Lean language server
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end

        -- Enable lean.nvim, and enable abbreviations and mappings
        require('lean').setup(opts)
        vim.lsp.config('leanls', {
            on_attach = on_attach,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'Enable virtual text for Lean',
            pattern = '*.lean',
            callback = function()
                vim.diagnostic.config({ virtual_text = true })
            end,
        })

        -- Update error messages even while you're typing in insert mode
        vim.diagnostic.config({
            underline = true,
            virtual_text = { spacing = 4 },
            update_in_insert = true,
        })
    end,
}
