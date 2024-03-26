local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "rust", "lua", "vim", "vimdoc", "latex", "ocaml",
        "yaml", "dockerfile", "bash", "html", "javascript", "css", "go",
        "json", "python", "fish" },
    sync_install = false,
    highlight = {
        enable = true,
        disable = { "make" },
    },
    indent = { enable = true },
})
