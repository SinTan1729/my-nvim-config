-- Automatically bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin via paq-nvim
require("lazy").setup({
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
    -- LSP related plugins
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",         -- For LSP completion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-omni",         -- For LaTeX completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "SirVer/ultisnips",         -- For snippets
    -- Support programming terms
    { "psliwka/vim-dirtytalk", build = ":DirtytalkUpdate" },
    -- vim-moonfly theme
    { "bluz71/vim-moonfly-colors", as = "moonfly" },
    -- Rust tools
    "simrat39/rust-tools.nvim",
    -- Automatically add bracket pairs
    "windwp/nvim-autopairs",
    -- Syntax highlighting for Fish scripts
    "khaveesh/vim-fish-syntax",
    -- Plugin for LaTeX
    "lervag/vimtex",
    -- Formatter
    "stevearc/conform.nvim",
    "junegunn/fzf.vim",
    "kylechui/nvim-surround",
})
