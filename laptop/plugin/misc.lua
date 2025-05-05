-- This file has configs for things that are not really related to anything else,
-- so don't really deserve to be put in a separate config file

-- Default settings for nvim-surround
require("nvim-surround").setup()

-- Default settings for log-highlight
require("log-highlight").setup()

-- Load UltiSnips snippets from custom-snippets directory
vim.g.UltiSnipsSnippetDirectories = { "my-snippets", "UltiSnips" }

-- Default settings for wrapping
require("wrapping").setup()
