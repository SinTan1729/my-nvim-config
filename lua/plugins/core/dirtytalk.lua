return {
    'belean/vim-dirtytalk',
    build = ':DirtytalkUpdate',
    init = function()
        vim.opt.spelllang:append('programming')
    end
}
