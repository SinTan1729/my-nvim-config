-- Use moonfly colors in popups
vim.g.moonflyNormalFloat = true

-- Extra setup to distinguish between edit and floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = "single"
    }
)
vim.diagnostic.config({ float = { border = "single" } })
-- Some more setup is inside cmp.lua

-- Make the background transparent
vim.g.moonflyTransparent = true

-- Display diagnostic virtual text in color
vim.g.moonflyVirtualTextColor = true

--  Use the moonfly colorscheme
vim.cmd [[colorscheme moonfly]]

