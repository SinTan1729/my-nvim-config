return {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    init = function()
        -- Use moonfly colors in popups
        vim.g.moonflyNormalFloat = true
        -- Distinguish between the edit and floating windows
        vim.o.winborder = 'single'
        -- Make the background transparent
        vim.g.moonflyTransparent = true
        -- Display diagnostic virtual text in color
        vim.g.moonflyVirtualTextColor = true
    end,
    config = function()
        --  Use the moonfly colorscheme
        vim.cmd.colorscheme('moonfly')
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1d1d1d" })
    end,
}
