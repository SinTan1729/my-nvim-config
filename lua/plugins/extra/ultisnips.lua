return {
    'SirVer/ultisnips',
    init = function()
        local g = vim.g
        g.UltiSnipsSnippetDirectories = { 'snips' }
        g.UltiSnipsExpandOrJumpTrigger = '<tab>'
        g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end,
}
