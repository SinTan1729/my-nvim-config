-- Install zpack with vim.pack directly
vim.pack.add({ 'https://github.com/zuqini/zpack.nvim' })

-- Load plugins via zpack.nvim
require('zpack').setup({
    spec = {
        { import = 'plugins.core' },
        {
            import = 'plugins.extra',
            enabled = os.getenv('NVIM_CONFIG_MODE') == 'full'
        }
    },
})
