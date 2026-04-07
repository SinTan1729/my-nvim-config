return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "linrongbin16/lsp-progress.nvim" },
    opts = function(_, opts)
        local lua_progress = function()
            return require('lsp-progress').progress()
        end

        opts.sections.lualine_c = { 'filename', lua_progress, 'searchcount' }

        return opts
    end,
}
