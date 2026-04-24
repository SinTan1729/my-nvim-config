return {
    -- Some miscellaneous plugins
    {
        'ficd0/academic.nvim',
        build = ':AcademicBuild',
    },
    { 'fei6409/log-highlight.nvim', opts = {} },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", lazy = true },
        opts = {},
    }
}
