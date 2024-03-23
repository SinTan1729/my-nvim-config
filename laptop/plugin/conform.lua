local cnf = require("conform")

-- Setup autoformat on save, with async for slow formatters
local slow_format_filetypes = { "tex" }
cnf.setup({
    formatters_by_ft = {
        tex = { "latexindent" },
    },

    format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        local function on_format(err)
            if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,

    format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        return { lsp_fallback = true }
    end,
})

cnf.formatters.latexindent = {
    -- command = "/usr/bin/latexindent",
    prepend_args = { "-g", "/dev/null" }, -- Do not create an indent.log file
    range_args = function(ctx)
        return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
    end,
}
