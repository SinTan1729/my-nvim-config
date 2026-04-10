return {
    'sak96/vim-dirtytalk',
    build = ':DirtytalkUpdate',
    commit = '88f7423b0627bbe37fb434ef9c71dd7fe41cc5b5',
    init = function()
        vim.opt.spelllang:append('programming')
    end
}
