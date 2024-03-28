local function total_lines()
    local lc = vim.fn.line('$')
    if lc < 1 then
        return ''
    elseif lc == 1 then
        return '(1 line)'
    else
        return string.format('(%d lines)', lc)
    end
end

require("lualine").setup {
    options = {
        theme = 'moonfly',
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'filename' },
        lualine_y = { total_lines },
        lualine_z = { 'tabs' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', require('lsp-progress').progress },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})
