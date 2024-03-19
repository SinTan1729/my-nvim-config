-- Automatically bootstrap paq-nvim
local function clone_paq()
    local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
    local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
    if not is_installed then
        vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path }
        return true
    end
end

-- Automatically install new packages at startup
local function bootstrap_paq(packages)
    local first_install = clone_paq()
    vim.cmd.packadd("paq-nvim")
    local paq = require("paq")
    paq(packages)
    if first_install then
        vim.notify("Installing plugins... If prompted, hit Enter to continue.")
        paq.install()
    end
end

-- Load plugins via paq-nvim
bootstrap_paq {
    -- Let paq-nvim manage itself
    "savq/paq-nvim",
    -- airline related plugins
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    -- Auto commenting per filetype
    "numToStr/Comment.nvim",
    -- Give option to save files using sudo, if needed
    "lambdalisue/suda.vim",
    -- Auto toggle for number mode when vim isn't focused
    "sitiom/nvim-numbertoggle",
    -- Plugin for lean
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    -- LSP related plugins
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",        -- For LSP completion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-vsnip",       -- For snippets
    "hrsh7th/vim-vsnip",       -- For snippets
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Support programming terms
    { "psliwka/vim-dirtytalk", build = ':let &rtp = &rtp | DirtytalkUpdate' },
    -- vim-moonfly theme
    { "bluz71/vim-moonfly-colors", as = 'moonfly' },
    -- Automatically add bracket pairs
    "windwp/nvim-autopairs",
    -- Syntax highlighting for Caddyfile
    "isobit/vim-caddyfile",
    -- Syntax highlighting for Fish scripts
    "khaveesh/vim-fish-syntax",
}

