local Combat = {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Adjust this path if the Swatter remote is located elsewhere
local Remotes = ReplicatedStorage:WaitForChild("Remotes") 

Combat.Flags = {
    AutoSlap = false,
    SlapAura = false,
    SlapRadius = 15
}

-- Auto Slap / Slap Aura Logic
task.spawn(function()
    while task.wait(0.1) do
        if Combat.Flags.AutoSlap or Combat.Flags.SlapAura then
            pcall(function()
                local character = LocalPlayer.Character
                if not character then return end
                
                local myRoot = character:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end

                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetRoot = player.Character.HumanoidRootPart
                        local distance = (myRoot.Position - targetRoot.Position).Magnitude
                        
                        -- If SlapAura is on, check distance. If AutoSlap is on, target regardless of distance.
                        if Combat.Flags.AutoSlap or (Combat.Flags.SlapAura and distance <= Combat.Flags.SlapRadius) then
                            -- You may need to pass the target player, their character, or their HumanoidRootPart depending on the remote
                            Remotes.Swatter:FireServer(player) 
                        end
                    end
                end
            end)
        end
    end
end)

return Combat
