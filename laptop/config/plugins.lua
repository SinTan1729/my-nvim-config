-- Automatically bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin via paq-nvim
require("lazy").setup({
    spec = {
        -- Use lualine for statusbar
        "nvim-lualine/lualine.nvim",
        "nvim-tree/nvim-web-devicons",
        -- Auto commenting per filetype
        "numToStr/Comment.nvim",
        -- Give option to save files using sudo, if needed
        "lambdalisue/suda.vim",
        -- Auto toggle for number mode when vim isn't focused
        "sitiom/nvim-numbertoggle",
        -- Plugin for lean
        "julian/lean.nvim",
        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" }
        },
        -- LSP related plugins
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        {
            "hrsh7th/nvim-cmp", -- For LSP completion
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "micangl/cmp-vimtex",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
            }
        },
        "SirVer/ultisnips", -- For snippets
        -- Support programming terms
        { "psliwka/vim-dirtytalk", build = ":DirtytalkUpdate" },
        -- Support academic terms
        { "ficcdaf/academic.nvim", build = ":AcademicBuild" },
        -- vim-moonfly theme
        {
            "bluz71/vim-moonfly-colors",
            name = "moonfly",
            lazy = false,
            priority = 1000
        },
        -- Rust tools
        {
            "mrcjkb/rustaceanvim",
            version = "^4",
            ft = { "rust" },
        },
        -- Automatically add bracket pairs
        "windwp/nvim-autopairs",
        -- Syntax highlighting for Fish scripts
        "khaveesh/vim-fish-syntax",
        -- Plugin for LaTeX
        "lervag/vimtex",
        -- Formatter
        "stevearc/conform.nvim",
        "kylechui/nvim-surround",
        "ibhagwan/fzf-lua",
        "karb94/neoscroll.nvim",
        "hiphish/rainbow-delimiters.nvim",
        "andrewferrier/wrapping.nvim",
        "fei6409/log-highlight.nvim",
        {
            "linrongbin16/lsp-progress.nvim",
            event = "LspAttach",
        },
        {
            "felpafel/inlay-hint.nvim",
            event = "LspAttach",
            config = true,
        },
        "dvrlabs/takeout.nvim",
    },
    lockfile = vim.fn.stdpath("config") .. "/config/lazy-lock.json",
    install = { missing = true, colorscheme = { "habamax" } },
    checker = { enabled = true },
})
