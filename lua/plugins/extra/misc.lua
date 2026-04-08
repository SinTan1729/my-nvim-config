return {
    -- LSP related plugins
    { "nvim-lua/plenary.nvim" },
    -- Support academic terms
    { "ficcdaf/academic.nvim",      build = ":AcademicBuild" },
    -- Formatter
    { "fei6409/log-highlight.nvim", opts = {} },
    {
        "aznhe21/actions-preview.nvim",
        dependencies = {
            "folke/snacks.nvim",
            priority = 1000,
            lazy = false,
            opts = {
                picker = { enabled = true },
                bigfile = { enabled = true },
                dashboard = {
                    enabled = true,
                    sections = {
                        { section = "header" },
                        { section = "keys",  gap = 1, padding = 1 },
                    },
                },
            },
        },
    },
}
