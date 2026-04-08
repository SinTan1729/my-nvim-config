local configs = { "autocmds", "globals", "keymaps" }
local load_extras = os.getenv("NVIM_CONFIG_MODE") == "full"

for _, config in ipairs(configs) do
    -- Load core configs
    require("config.core." .. config)
    -- Optionally load extra configs
    if load_extras then
        require("config.extra." .. config)
    end
end

-- Load plugins using lazy.nvim
require("config.zpack")
