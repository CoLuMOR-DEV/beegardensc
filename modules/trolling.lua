local Trolling = {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Adjust this path to match the game's remote structure
local Remotes = ReplicatedStorage:WaitForChild("Remotes") 

Trolling.Flags = {
    AutoStealEggs = false,
    TeleportToEggs = false -- Toggle this if the game requires you to physically touch the dropped eggs
}

-- Auto Steal Eggs Logic
task.spawn(function()
    while task.wait(0.2) do
        if Trolling.Flags.AutoStealEggs then
            pcall(function()
                -- You will need to use Dex to find the exact folder name where dropped eggs are stored
                local dropsFolder = Workspace:FindFirstChild("Drops") or Workspace:FindFirstChild("Eggs")
                
                if dropsFolder then
                    for _, egg in ipairs(dropsFolder:GetChildren()) do
                        if egg:IsA("BasePart") or egg:IsA("Model") then
                            
                            -- Physical Steal (Teleporting to the egg)
                            if Trolling.Flags.TeleportToEggs then
                                local character = LocalPlayer.Character
                                if character then
                                    local myRoot = character:FindFirstChild("HumanoidRootPart")
                                    if myRoot then
                                        local targetCFrame = egg:IsA("Model") and egg.PrimaryPart.CFrame or egg.CFrame
                                        myRoot.CFrame = targetCFrame
                                    end
                                end
                            end
                            
                            -- Remote Steal (Firing the claim remote directly)
                            -- Replace "ClaimEgg" with the exact remote name used for picking up eggs
                            if Remotes:FindFirstChild("ClaimEgg") then
                                Remotes.ClaimEgg:FireServer(egg)
                            end
                            
                        end
                    end
                end
            end)
        end
    end
end)

return Trolling
