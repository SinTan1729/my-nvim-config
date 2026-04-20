-- This file defines all the global config
local set = vim.opt
local g = vim.g
local fn = vim.fn

-- Customize inccommand
set.cmdwinheight = 10
set.inccommand = 'split'

-- Make nvim work nicely with python venvs
g.python3_host_prog = fn.system("which -a python3 | head -n2 | tail -n1 | tr -d '[:space:]'")

-- Nice status bar with pretty LSP signs
set.signcolumn = 'auto:1-2'

local diag = vim.diagnostic
local sev = diag.severity
local orig = vim.diagnostic.handlers.signs
diag.config({
    signs = {
        text = {
            [sev.ERROR] = '',
            [sev.WARN]  = '',
            [sev.INFO]  = '',
            [sev.HINT]  = '󰌵',
        },
    },
})
vim.diagnostic.handlers.signs = {
    show = function(ns, bufnr, diagnostics, opts)
        local max_per_line = {}
        for _, d in ipairs(diagnostics) do
            local lnum = d.lnum
            local existing = max_per_line[lnum]
            if not existing or d.severity < existing.severity then
                max_per_line[lnum] = d
            end
        end
        orig.show(ns, bufnr, vim.tbl_values(max_per_line), opts)
    end,
    hide = orig.hide,
}
