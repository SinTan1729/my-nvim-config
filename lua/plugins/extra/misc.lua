return {
    -- Some miscellaneous plugins
    {
        'ficd0/academic.nvim',
        build = ':AcademicBuild',
    },
    { 'cyb3r-w0lf/remove-comments', commit = '53b95f59e43fad4d1bc382e61ff46cbda6dcbe73' }, -- Stay on this fork until changes are merged to the main repo
    { 'fei6409/log-highlight.nvim', opts = {} },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
        opts = {},
    }
}
