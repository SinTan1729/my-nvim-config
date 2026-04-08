return {
    "mrcjkb/rustaceanvim",
    version = vim.version.range("^8"),
    lazy = false,
    init = function()
        vim.g.rustaceanvim = {
            tools = {
                enable_clippy = true,
            },
        }
    end,
}
