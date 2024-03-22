-- Load the different config files
package.path = package.path .. ';' .. vim.fn.stdpath("config") .. "/?.lua"

-- Load global configs
require("globals")
-- Load plugins using lazy.nvim
require("plugins")
-- Load keymaps
require("keymaps")

