-- Load the different config files
package.path = vim.fn.stdpath("config") .. "/config/?.lua" .. ';' .. package.path

-- Load global configs
require("globals")
-- Load plugins using lazy.nvim
require("plugins")
-- Load keymaps
require("keymaps")
