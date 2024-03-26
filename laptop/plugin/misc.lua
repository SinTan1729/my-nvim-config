-- This file lists all the plugins that need to be initiated to default setup

-- Default settings for comment plugin
require("Comment").setup()

-- Default settings for nvim-surround
require("nvim-surround").setup()

-- Load UltiSnips snippets from custom-snippets directory
vim.g.UltiSnipsSnippetDirectories = { "my-snippets", "UltiSnips" }
