local neoscroll = require("neoscroll")

-- Keep cursor away from the edges
vim.opt.scrolloff = 8

neoscroll.setup({
    -- Default easing function used in any animation where
    -- the `easing` argument has not been explicitly supplied
    hide_cursor = true,            -- Hide cursor while scrolling
    stop_eof = true,               -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true,   -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "quadratic", -- Default easing function
    pre_hook = nil,                -- Function to run before the scrolling animation starts
    post_hook = nil,               -- Function to run after the scrolling animation ends
    performance_mode = false,      -- Disable "Performance Mode" on all buffers.
})

local keymap = {
    -- Use the "sine" easing function
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250, easing = 'sine' }) end,
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250, easing = 'sine' }) end,
    -- Use the "circular" easing function
    ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450, easing = 'circular' }) end,
    ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450, easing = 'circular' }) end,
    -- When no value is passed the `easing` option supplied in `setup()` is used
    ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
    ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func, { desc = 'Smooth scrolling maps' })
end
