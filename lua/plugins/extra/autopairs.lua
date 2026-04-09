return {
    'windwp/nvim-autopairs',
    dependencies = {
        {
            'windwp/nvim-ts-autotag',
            opts = {
                enable_close = true,          -- Auto close tags
                enable_rename = true,         -- Auto rename pairs of tags
                enable_close_on_slash = false -- Auto close on trailing </
            },
            config = function(_, opts)
                -- Needed due to some weird behavior of this plugin
                require('nvim-ts-autotag').setup({
                    opts = opts
                })
            end,
        }
    },
    opts = {
        -- will ignore alphanumeric and `.` symbol
        ignored_next_char = '[%w%.]',
    },
    config = function(_, opts)
        local Rule = require('nvim-autopairs.rule')
        local npairs = require('nvim-autopairs')
        local cond = require('nvim-autopairs.conds')

        npairs.setup(opts)

        npairs.add_rules({
                Rule('\\(', '\\)', { 'tex', 'latex' }),
                Rule('\\[', '\\]', { 'tex', 'latex' }),
            },
            -- disable for .vim files, but it work for another filetypes
            Rule('a', 'a', '-vim')
        )

        -- Add spaces between brackets
        local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
        npairs.add_rules {
            -- Rule for a pair with left-side ' ' and right side ' '
            Rule(' ', ' ')
            -- Pair will only occur if the conditional function returns true
                :with_pair(function(opts1)
                    -- We are checking if we are inserting a space in (), [], or {}
                    local pair = opts1.line:sub(opts1.col - 1, opts1.col)
                    return vim.tbl_contains({
                        brackets[1][1] .. brackets[1][2],
                        brackets[2][1] .. brackets[2][2],
                        brackets[3][1] .. brackets[3][2]
                    }, pair)
                end)
                :with_move(cond.none())
                :with_cr(cond.none())
            -- We only want to delete the pair of spaces when the cursor is as such: ( | )
                :with_del(function(opts1)
                    local col = vim.api.nvim_win_get_cursor(0)[2]
                    local context = opts1.line:sub(col - 1, col + 2)
                    return vim.tbl_contains({
                        brackets[1][1] .. '  ' .. brackets[1][2],
                        brackets[2][1] .. '  ' .. brackets[2][2],
                        brackets[3][1] .. '  ' .. brackets[3][2]
                    }, context)
                end)
        }
        -- For each pair of brackets we will add another rule
        for _, bracket in pairs(brackets) do
            npairs.add_rules {
                -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
                Rule(bracket[1] .. ' ', ' ' .. bracket[2])
                    :with_pair(cond.none())
                    :with_move(function(opts1) return opts1.char == bracket[2] end)
                    :with_del(cond.none())
                    :use_key(bracket[2])
                -- Removes the trailing whitespace that can occur without this
                    :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
            }
        end

        -- Add space around =
        npairs.add_rules {
            Rule('=', '', { '-tex', '-vim', '-sh', '-dockerfile', '-make', '-html', '-systemd' })
                :with_pair(cond.not_inside_quote())
                :with_pair(function(opts1)
                    local last_char = opts1.line:sub(opts1.col - 1, opts1.col - 1)
                    if last_char:match('[%w%=%s]') then
                        return true
                    end
                    return false
                end)
                :replace_endpair(function(opts1)
                    local prev_2char = opts1.line:sub(opts1.col - 2, opts1.col - 1)
                    local next_char = opts1.line:sub(opts1.col, opts1.col)
                    next_char = next_char == ' ' and '' or ' '
                    if prev_2char:match('%w$') then
                        return '<bs> =' .. next_char
                    end
                    if prev_2char:match('%=$') then
                        return next_char
                    end
                    if prev_2char:match('=') then
                        return '<bs><bs>=' .. next_char
                    end
                    return ''
                end)
                :set_end_pair_length(0)
                :with_move(cond.none())
                :with_del(cond.none())
        }

        -- Insertion with surrounding check
        local function rule2(a1, ins, a2, lang)
            npairs.add_rule(
                Rule(ins, ins, lang)
                :with_pair(function(opts1) return a1 .. a2 == opts1.line:sub(opts1.col - #a1, opts1.col + #a2 - 1) end)
                :with_move(cond.none())
                :with_cr(cond.none())
                :with_del(function(opts1)
                    local col = vim.api.nvim_win_get_cursor(0)[2]
                    return a1 .. ins .. ins .. a2 ==
                        opts1.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
                end)
            )
        end

        -- Only use it for ocaml
        rule2('(', '*', ')', 'ocaml')
        rule2('(*', ' ', '*)', 'ocaml')
        rule2('(', ' ', ')')
    end,
}
