-- cx.farm | main_loader.lua

-- Define the raw GitHub content URL base for your repository
local repo_url = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/"

-- Helper function to fetch and load scripts securely
local function loadModule(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(repo_url .. path))()
    end)
    
    if not success then
        warn("cx.farm | Failed to load file: " .. path)
        warn("Error: " .. tostring(result))
    end
    
    return result
end

-- Since we are in Bee Garden, we load the Bee Garden UI and Hub file directly.
-- If you expand to other games later, you can add a game ID check here.
print("cx.farm | Initializing Bee Garden...")
loadModule("games/bee_garden.lua")
