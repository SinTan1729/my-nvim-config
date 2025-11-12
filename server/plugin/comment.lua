-- Default settings for comment plugin
require("Comment").setup()

-- Define custom commentstrings
local ft = require("Comment.ft")
ft.caddy = "#%s"
ft.systemd = "#%s"

