-- Load base configs
require("config.base.globals")
require("config.base.keymaps")

-- Optionally load extra configs
if os.getenv("NVIM_CONFIG_MODE") == "full" then
    require("config.extra.globals")
    require("config.extra.keymaps")
end

-- Load plugins using lazy.nvim
require("config.lazy")
