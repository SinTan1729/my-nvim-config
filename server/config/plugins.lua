-- Automatically bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins via lazy.nvim
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
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- LSP related plugins
    "neovim/nvim-lspconfig",
    {
        "hrsh7th/nvim-cmp",         -- For LSP completion
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        }
    },
    -- Support programming terms
    { "psliwka/vim-dirtytalk", build = ":DirtytalkUpdate" },
    -- vim-moonfly theme
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000
    },
    -- Automatically add bracket pairs
    "windwp/nvim-autopairs",
    -- Syntax highlighting for Caddyfile
    "isobit/vim-caddyfile",
    -- Syntax highlighting for Fish scripts
    "khaveesh/vim-fish-syntax",
    "kylechui/nvim-surround",
    "ibhagwan/fzf-lua",
    "karb94/neoscroll.nvim",
    },
    lockfile = vim.fn.stdpath("config") .. "/config/lazy-lock.json",
    install = { missing = true, colorscheme = { "habamax" } },
    checker = { enabled = true },
})

