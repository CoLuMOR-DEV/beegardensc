-- cx.farm | games/bee_garden.lua

-- 1. Load the backend modules from GitHub
local repo_url = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/"

local function fetchModule(path)
    return loadstring(game:HttpGet(repo_url .. path))()
end

local TycoonModule = fetchModule("modules/tycoon.lua")

-- 2. Load the X2ZU UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

-- 3. Create Main Window
local Window = Library:Window({
    Title = "cx.farm [ Bee Garden ]",
    Desc = "Stellar Performance",
    Icon = 105059922903197,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.RightControl, -- Standard for modern hubs
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "cx.farm"
    }
})

-- Sidebar Vertical Separator
local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0)
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Name = "SidebarLine"
SidebarLine.Parent = game:GetService("CoreGui")

-- 4. Create the Auto-Farm Tab
local FarmTab = Window:Tab({Title = "Auto-Farm", Icon = "home"}) do
    
    FarmTab:Section({Title = "Tycoon Farming"})

    FarmTab:Toggle({
        Title = "Auto-Collect Coins",
        Desc = "Continuously claims coins from your honey pot.",
        Value = false,
        Callback = function(state)
            TycoonModule.Config.AutoCollect = state
        end
    })

    FarmTab:Toggle({
        Title = "Auto-Sell All",
        Desc = "Instantly bulk-sells your entire inventory.",
        Value = false,
        Callback = function(state)
            TycoonModule.Config.AutoSell = state
        end
    })

    -- Placeholder for the conveyor upgrade logic we map out next
    FarmTab:Button({
        Title = "Force Upgrade Conveyor",
        Desc = "Attempts to unlock the next Queen bee.",
        Callback = function()
            local Events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            if Events and Events:FindFirstChild("HandleConveyor") then
                Events.HandleConveyor:FireServer("Upgrade")
                Window:Notify({
                    Title = "Success",
                    Desc = "Fired conveyor upgrade remote.",
                    Time = 2
                })
            end
        end
    })
end

-- Line Separator
Window:Line()

-- 5. Final Notification
Window:Notify({
    Title = "cx.farm",
    Desc = "Bee Garden modules loaded successfully!",
    Time = 4
})