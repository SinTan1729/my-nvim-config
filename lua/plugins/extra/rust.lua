return {
    'mrcjkb/rustaceanvim',
    version = vim.version.range('^8'),
    lazy = false,
    init = function()
        vim.g.rustaceanvim = {
            tools = {
                enable_clippy = true,
            },
        }
        local group = vim.api.nvim_create_augroup('rust-lsp', { clear = true })
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'Disable buggy unresolvedReference semantics tokens in rust',
            group = group,
            callback = function()
                vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference.rust', {})
            end,
        })
    end,
}
