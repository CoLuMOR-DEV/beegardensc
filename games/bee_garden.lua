-- Fetch the X2ZU Library (Replace the URL if you have a specific custom fork hosted elsewhere)
local Library = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- Define the base raw URL for your GitHub repository
local baseUrl = "https://raw.githubusercontent.com/CoLuMOR-DEV/beegardensc/main/modules/"

-- Load all backend modules
local Tycoon = loadstring(game:HttpGet(baseUrl .. "tycoon.lua"))()
local Hatching = loadstring(game:HttpGet(baseUrl .. "hatching.lua"))()
local Movement = loadstring(game:HttpGet(baseUrl .. "movement.lua"))()
local Combat = loadstring(game:HttpGet(baseUrl .. "combat.lua"))()
local Trolling = loadstring(game:HttpGet(baseUrl .. "trolling.lua"))()

-- Initialize the Main Window
local Window = Library:CreateWindow({
    Name = "cx.farm | Bee Garden",
    LoadingTitle = "Loading cx.farm scripts...",
    LoadingSubtitle = "by Hanz",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "cx.farm_Configs",
        FileName = "BeeGarden"
    }
})

-- ==========================================
-- TYCOON TAB
-- ==========================================
local TycoonTab = Window:CreateTab("Tycoon", 4483345998)
local TycoonSection = TycoonTab:CreateSection("Farming Automation")

TycoonTab:CreateToggle({
    Name = "Auto-Collect Coins",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(Value)
        Tycoon.Flags.AutoCollect = Value
    end,
})

TycoonTab:CreateToggle({
    Name = "Auto-Sell Inventory",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        Tycoon.Flags.AutoSell = Value
    end,
})

TycoonTab:CreateToggle({
    Name = "Auto-Upgrade Conveyors",
    CurrentValue = false,
    Flag = "AutoUpgrade",
    Callback = function(Value)
        Tycoon.Flags.AutoUpgradeConveyors = Value
    end,
})

-- ==========================================
-- HATCHING TAB
-- ==========================================
local HatchingTab = Window:CreateTab("Hatching", 4483345998)
local HatchingSection = HatchingTab:CreateSection("Egg Management")

HatchingTab:CreateDropdown({
    Name = "Select Egg Tier",
    Options = {"Basic", "Rare", "Epic", "Legendary"}, -- Update with actual game egg names
    CurrentOption = "Basic",
    Flag = "SelectedEgg",
    Callback = function(Option)
        Hatching.Flags.SelectedEgg = Option
    end,
})

HatchingTab:CreateToggle({
    Name = "Auto-Hatch Selected Egg",
    CurrentValue = false,
    Flag = "AutoHatch",
    Callback = function(Value)
        Hatching.Flags.AutoHatch = Value
    end,
})

HatchingTab:CreateToggle({
    Name = "Auto-Equip Best Bees",
    CurrentValue = false,
    Flag = "AutoEquip",
    Callback = function(Value)
        Hatching.Flags.AutoEquipBest = Value
    end,
})

HatchingTab:CreateToggle({
    Name = "Auto-Delete Low Tier Bees",
    CurrentValue = false,
    Flag = "AutoDelete",
    Callback = function(Value)
        Hatching.Flags.AutoDelete = Value
    end,
})

-- ==========================================
-- MOVEMENT TAB
-- ==========================================
local MovementTab = Window:CreateTab("Movement", 4483345998)
local TeleportSection = MovementTab:CreateSection("Teleports")

MovementTab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        Movement.TeleportTo("Spawn")
    end,
})

MovementTab:CreateButton({
    Name = "Teleport to Sell Area",
    Callback = function()
        Movement.TeleportTo("SellArea")
    end,
})

MovementTab:CreateButton({
    Name = "Teleport to Fountain",
    Callback = function()
        Movement.TeleportTo("Fountain")
    end,
})

local PlayerModsSection = MovementTab:CreateSection("Player Modifiers")

MovementTab:CreateToggle({
    Name = "Enable Movement Modifiers",
    CurrentValue = false,
    Flag = "ModifyMovement",
    Callback = function(Value)
        Movement.Flags.ModifyMovement = Value
    end,
})

MovementTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        Movement.Flags.WalkSpeed = Value
    end,
})

MovementTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    Increment = 1,
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        Movement.Flags.JumpPower = Value
    end,
})

-- ==========================================
-- COMBAT TAB
-- ==========================================
local CombatTab = Window:CreateTab("Combat", 4483345998)
local CombatSection = CombatTab:CreateSection("Auto Slapper")

CombatTab:CreateToggle({
    Name = "Auto-Slap (Global)",
    CurrentValue = false,
    Flag = "AutoSlap",
    Callback = function(Value)
        Combat.Flags.AutoSlap = Value
    end,
})

CombatTab:CreateToggle({
    Name = "Slap Aura (Proximity)",
    CurrentValue = false,
    Flag = "SlapAura",
    Callback = function(Value)
        Combat.Flags.SlapAura = Value
    end,
})

-- ==========================================
-- TROLLING TAB
-- ==========================================
local TrollingTab = Window:CreateTab("Trolling", 4483345998)
local TrollingSection = TrollingTab:CreateSection("Item Stealer")

TrollingTab:CreateToggle({
    Name = "Auto-Steal Dropped Eggs",
    CurrentValue = false,
    Flag = "AutoStealEggs",
    Callback = function(Value)
        Trolling.Flags.AutoStealEggs = Value
    end,
})

TrollingTab:CreateToggle({
    Name = "Teleport to Eggs (Physical Claim)",
    CurrentValue = false,
    Flag = "TeleportToEggs",
    Callback = function(Value)
        Trolling.Flags.TeleportToEggs = Value
    end,
})

-- Load the library UI
Library:LoadConfiguration()
