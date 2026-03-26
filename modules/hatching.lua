local Hatching = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes") -- Adjust to your exact remote path

Hatching.Flags = {
    AutoHatch = false,
    AutoEquipBest = false,
    AutoDelete = false,
    SelectedEgg = "Basic" -- Example egg tier
}

-- Auto Hatching Logic
task.spawn(function()
    while task.wait(0.5) do
        if Hatching.Flags.AutoHatch then
            pcall(function()
                -- Replace with the exact arguments needed for PurchaseConveyorEgg
                Remotes.PurchaseConveyorEgg:InvokeServer(Hatching.Flags.SelectedEgg) 
            end)
        end
    end
end)

-- Auto Equip Best Logic
task.spawn(function()
    while task.wait(2) do
        if Hatching.Flags.AutoEquipBest then
            pcall(function()
                Remotes.EquipBest:InvokeServer()
            end)
        end
    end
end)

-- Auto Delete Logic (Example)
task.spawn(function()
    while task.wait(5) do
        if Hatching.Flags.AutoDelete then
            pcall(function()
                -- You will likely need to pass a table of bee IDs to destroy
                -- Remotes.DestroyMultipleBees:InvokeServer(beeList)
            end)
        end
    end
end)

return Hatching
