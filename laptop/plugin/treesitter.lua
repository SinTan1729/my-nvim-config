local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "rust", "lua", "vim", "vimdoc", "latex", "ocaml", "yaml", "dockerfile", "make" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
