return {
    'linrongbin16/lsp-progress.nvim',
    event = 'LspAttach',
    opts = function()
        local get_client_names = function()
            return table.concat(vim.tbl_map(function(c) return c.name end,
                vim.lsp.get_active_clients()), ', ')
        end

        local opts = {
            spinner = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },

            client_format = function(client, spinner, series_messages)
                if series_messages and #series_messages > 0 then
                    local names = client and client.name
                        or get_client_names()
                    return spinner .. ' ' .. names
                end
                return ''
            end,

            format = function(messages)
                if messages and #messages > 0 then
                    return table.concat(messages, ' ')
                end

                local names = get_client_names()
                return names ~= '' and (' ' .. names) or ''
            end,
        }
        return opts
    end,
}
