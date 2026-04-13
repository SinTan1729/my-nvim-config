return {
    'lambdalisue/suda.vim',
    init = function()
        local group = vim.api.nvim_create_augroup('suda', { clear = true })
        vim.api.nvim_create_autocmd('BufEnter', {
            desc = 'Enable suda outside of diffs',
            group = group,
            callback = function()
                if vim.wo.diff then
                    vim.g.suda_smart_edit = 0
                else
                    vim.g.suda_smart_edit = 1
                end
            end,
        })
    end,
}
