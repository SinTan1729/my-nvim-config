local configs = { "globals", "keymaps" }

-- Load core configs
for _, config in ipairs(configs) do
    require("config.core." .. config)
end

-- Optionally load extra configs
if os.getenv("NVIM_CONFIG_MODE") == "full" then
    for _, config in ipairs(configs) do
        require("config.extra." .. config)
    end
end

-- Load plugins using lazy.nvim
require("config.lazy")
