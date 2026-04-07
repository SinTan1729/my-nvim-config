return {
    "mrcjkb/rustaceanvim",
    version = "^8",
    lazy = false,
    init = function()
        vim.g.rustaceanvim = {
            tools = {
                enable_clippy = true,
            },
        }
    end,
}
