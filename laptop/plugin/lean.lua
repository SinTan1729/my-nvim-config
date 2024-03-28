-- You may want to reference the nvim-lspconfig documentation, found at:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- The below is just a simple initial set of mappings which will be bound
-- within Lean files.
local function on_attach(_, bufnr)
    local function cmd(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, buffer = true })
    end

    -- Autocomplete using the Lean language server
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- gd in normal mode will jump to definition
    cmd('n', 'gd', vim.lsp.buf.definition)

    -- <localleader>n will jump to the next Lean line with a diagnostic message on it
    -- <localleader>N will jump backwards
    cmd('n', '<localleader>n', function() vim.diagnostic.goto_next { popup_opts = { show_header = false } } end)
    cmd('n', '<localleader>N', function() vim.diagnostic.goto_prev { popup_opts = { show_header = false } } end)

    -- <localleader>K will show all diagnostics for the current line in a popup window
    cmd('n', '<localleader>k',
        function() vim.diagnostic.open_float(0, { scope = "line", header = false, focus = false }) end)

    -- <localleader>q will load all errors in the current lean file into the location list
    -- (and then will open the location list)
    -- see :h location-list if you don't generally use it in other vim contexts
    cmd('n', '<localleader>q', vim.diagnostic.setloclist)
end

-- Enable lean.nvim, and enable abbreviations and mappings
require('lean').setup {
    abbreviations = { builtin = true },
    lsp = { on_attach = on_attach },
    lsp3 = { on_attach = on_attach },
    mappings = true,
}

-- Update error messages even while you're typing in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = { spacing = 4 },
        update_in_insert = true,
    }
)
