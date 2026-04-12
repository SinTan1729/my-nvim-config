return {
    'sak96/vim-dirtytalk',
    build = ':DirtytalkUpdate',
    commit = '6d5abdd8430a68d887ee89d3910ecb6082c6118e',
    init = function()
        vim.opt.spelllang:append('programming')
    end
}
