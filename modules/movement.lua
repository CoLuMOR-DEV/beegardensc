local Movement = {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Define teleport locations 
-- Important: You will need to grab the exact Vector3 coordinates in-game 
-- using a Dex explorer or coordinate logger for these to work perfectly.
local Locations = {
    SellArea = Vector3.new(0, 50, 0), -- Replace with actual Sell Area coordinates
    Fountain = Vector3.new(100, 50, 100), -- Replace with actual Fountain coordinates
    Spawn = Vector3.new(0, 50, 50) -- Replace with actual Spawn coordinates
}

Movement.Flags = {
    WalkSpeed = 16,
    JumpPower = 50,
    ModifyMovement = false
}

-- Teleport Function
function Movement.TeleportTo(locationName)
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart and Locations[locationName] then
        -- Teleport using CFrame to bypass physics/clipping issues
        humanoidRootPart.CFrame = CFrame.new(Locations[locationName])
    else
        warn("Could not teleport: Invalid location or missing HumanoidRootPart.")
    end
end

-- WalkSpeed and JumpPower Modifier Logic
task.spawn(function()
    while task.wait(0.1) do
        if Movement.Flags.ModifyMovement then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    -- Forces the speed and jump power to your custom flag values
                    humanoid.WalkSpeed = Movement.Flags.WalkSpeed
                    humanoid.JumpPower = Movement.Flags.JumpPower
                end
            end
        end
    end
end)

return Movement
