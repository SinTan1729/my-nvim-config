local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "rust", "lua", "vim", "vimdoc", "latex", "ocaml",
        "yaml", "dockerfile", "make", "bash", "html", "javascript", "css" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
