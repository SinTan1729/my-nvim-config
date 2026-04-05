local specs = {}

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/plugins")) do
    if file:match("%.lua$") and file ~= "init.lua" then
        local name = file:gsub("%.lua$", "")
        local mod = require(name)

        if type(mod) == "table" then
            -- If it's a list of plugins
            if vim.islist(mod) and type(mod[1]) == "table" then
                vim.list_extend(specs, mod)
            else
                -- Single plugin spec
                table.insert(specs, mod)
            end
        else
            error("Invalid spec in plugins/" .. name .. ".lua")
        end
    end
end

return specs
