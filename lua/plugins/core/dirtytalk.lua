return {
    'psliwka/vim-dirtytalk',
    build = ':DirtytalkUpdate',
    init = function()
        vim.opt.spelllang:append('programming')
    end
}
