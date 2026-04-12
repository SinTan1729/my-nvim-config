return {
    -- Some miscellaneous plugins
    {
        'danielfleischer/academic.nvim',
        build = ':AcademicBuild',
        branch = 'patch-1',
        commit = '48048fed33fa862d12bd61a864721bf1ad5a1ee9',
    },
    { 'fei6409/log-highlight.nvim', opts = {} },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", lazy = true },
        opts = {},
    }
}
