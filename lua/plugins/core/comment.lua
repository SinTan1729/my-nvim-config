return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
        -- Define custom commentstrings
        local ft = require('Comment.ft')
        ft.caddy = '#%s'
        ft.systemd = '#%s'
    end,
}
