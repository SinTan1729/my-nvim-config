-- Ensure that the binary spl file is up-to-date with the source add file
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local config_path = vim.fn.stdpath("config") -- Get Neovim's config path
        local add_file = config_path .. "/config/custom-dict.utf-8.add"
        local spl_file = config_path .. "/config/custom-dict.utf-8.add.spl"

        if vim.fn.filereadable(add_file) == 1 then
            local add_mtime = vim.fn.getftime(add_file) -- Get modification time of .add file
            local spl_mtime = vim.fn.getftime(spl_file) -- Get modification time of .add.spl file

            -- Run mkspell! only if .add is newer than .add.spl or .add.spl doesn't exist
            if (add_mtime > spl_mtime) or (spl_mtime == -1) then
                vim.cmd("silent! mkspell! " .. spl_file .. " " .. add_file)
            end
        end
    end,
})
