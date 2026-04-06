return {
    "SirVer/ultisnips",
    init = function()
        local g = vim.g
        g.UltiSnipsSnippetDirectories = {
            "my-snippets", "UltiSnips"
        }
        g.UltiSnipsExpandOrJumpTrigger = '<tab>'
        g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end,
}
