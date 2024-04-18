-- This file lists all the plugins that need to be initiated to default setup

-- Default settings for comment plugin
require("Comment").setup()

-- Default settings for nvim-surround
require("nvim-surround").setup()

-- Default settings for log-highlight
require("log-highlight").setup()

-- Load UltiSnips snippets from custom-snippets directory
vim.g.UltiSnipsSnippetDirectories = { "my-snippets", "UltiSnips" }

-- Load default settings for inlay hints plugin (won't need it for nvim>=0.10)
require("lsp-inlayhints").setup()
