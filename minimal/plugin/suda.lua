-- Disable Suda in diff views
if not vim.api.nvim_win_get_option(0, 'diff') then
    vim.g.suda_smart_edit = 1
end

