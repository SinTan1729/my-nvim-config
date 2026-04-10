return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'smjonas/inc-rename.nvim',     opts = {} },
        { 'aznhe21/actions-preview.nvim' },
        {
            'felpafel/inlay-hint.nvim',
            event = 'LspAttach',
            config = true,
        },
    },
    config = function()
        local map = vim.keymap.set
        local lsp = vim.lsp

        -- Helper function for LSP configs
        local lsp_config = function(server, config)
            lsp.config(server, config)
            lsp.enable(server)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'Configure LSP based movements',
            callback = function()
                lsp.inlay_hint.enable(true)
                map('n', '<localleader>k', lsp.buf.hover, { remap = false, desc = 'Hover using LSP' })
                map({ 'v', 'n' }, '<localleader>a', require('actions-preview').code_actions,
                    { remap = false, desc = 'Preview LSP actions' })
                map('n', '<localleader>f', lsp.buf.definition, { remap = false, desc = 'Jump to definition' })
                map('n', '<localleader>d', vim.diagnostic.open_float,
                    { remap = false, desc = 'Show current diagnostic message' })
                map('n', '<localleader>n', vim.diagnostic.goto_next,
                    { remap = false, desc = 'Go to next diagnostic message' })
                map('n', '<localleader>N', vim.diagnostic.goto_prev,
                    { remap = false, desc = 'Go to previous diagnostic message' })
                map('n', '<leader>r', function() return ':IncRename ' .. vim.fn.expand('<cword>') end,
                    { remap = false, expr = true, desc = 'Rename variable using LSP' })
            end,
        })

        -- Python
        lsp.enable('ty')
        lsp_config('ruff', {
            init_options = {
                settings = {
                    lineLength = 100,
                }
            }
        })

        -- Lua
        lsp_config('luals', {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } },
                    telemetry = { enable = false },
                },
            }
        })
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'Hack to make the diagnostics appear at launch',
            callback = function(args)
                if vim.bo[args.buf].filetype ~= 'lua' then return end
                vim.defer_fn(function()
                    vim.api.nvim_buf_call(args.buf, function()
                        local view = vim.fn.winsaveview()
                        if vim.bo.modified then
                            return
                        end
                        vim.cmd('silent keepjumps normal! >>')
                        vim.cmd('silent keepjumps undo')
                        vim.fn.winrestview(view)
                    end)
                end, 1000)
            end,
        })

        -- Misc
        lsp.enable({ 'bashls', 'fish_lsp', 'gopls', 'hls' })

        vim.api.nvim_create_autocmd('FileType', {
            desc = 'Warn about failed LSP configs',
            pattern = { 'lua', 'python', 'rust', 'fish', 'bash', 'sh', 'go', 'haskell', 'rust' },
            callback = function(args)
                local bufnr = args.buf

                vim.defer_fn(function()
                    local clients = vim.lsp.get_clients({ bufnr = bufnr })
                    if #clients == 0 then
                        vim.notify('No LSP attached (possible startup failure)', vim.log.levels.WARN)
                    end
                end, 2000)
            end,
        })
    end,
}
