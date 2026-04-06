return {
    -- Auto toggle for number mode when vim isn't focused
    "sitiom/nvim-numbertoggle",
    -- Plugin for lean
    "julian/lean.nvim",
    -- Treesitter
    -- LSP related plugins
    "nvim-lua/plenary.nvim",
    -- Support academic terms
    { "ficcdaf/academic.nvim",  build = ":AcademicBuild" },
    -- vim-moonfly theme
    -- Rust tools
    -- Automatically add bracket pairs
    -- Plugin for LaTeX
    -- Formatter
    { "kylechui/nvim-surround", opts = {} },
    "hiphish/rainbow-delimiters.nvim",
    { "fei6409/log-highlight.nvim", opts = {} },
    {
        "felpafel/inlay-hint.nvim",
        event = "LspAttach",
        config = true,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = { enabled = true },
            bigfile = { enabled = true },
            dashboard = { enabled = true },
        },
    },
    "dvrlabs/takeout.nvim",
    "aznhe21/actions-preview.nvim",
    { "smjonas/inc-rename.nvim",    opts = {} },
}
