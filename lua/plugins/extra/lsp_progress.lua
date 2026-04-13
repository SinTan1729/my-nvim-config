return {
    'linrongbin16/lsp-progress.nvim',
    event = 'LspAttach',
    opts = {
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },

        client_format = function(client, spinner, series_messages)
            if series_messages and #series_messages > 0 then
                local name = client and client.name
                    or table.concat(vim.tbl_map(function(c) return c.name end,
                        vim.lsp.get_active_clients()), ", ")
                return spinner .. " " .. name
            end
            return ""
        end,

        format = function(messages)
            if messages and #messages > 0 then
                return table.concat(messages, " ")
            end

            local names = vim.tbl_map(function(c) return c.name end,
                vim.lsp.get_active_clients())
            return #names > 0 and (" " .. table.concat(names, ", ")) or ""
        end,
    }
}
