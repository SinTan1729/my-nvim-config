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
    end,
})


-- Python
lsp_config('ruff', {
    init_options = {
        settings = {
            lineLength = 100,
        }
    }
})

local function get_python_path(workspace)
    if vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV .. '/bin/python'
    end

    workspace = workspace or vim.fn.getcwd()
    local pycfg = io.open(workspace .. '/.venv/pyvenv.cfg', "r")
    if pycfg then
        pycfg:close()
        return workspace .. '/.venv/bin/python'
    end

    return 'python'
end
lsp_config('pyright', {
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
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
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_python', { clear = true }),
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
