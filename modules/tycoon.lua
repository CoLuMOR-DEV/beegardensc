-- cx.farm | modules/tycoon.lua

local Tycoon = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")

-- State variables controlled by the UI
Tycoon.Config = {
    AutoCollect = false,
    AutoSell = false
}

-- Auto Collect Loop
task.spawn(function()
    while task.wait(0.5) do
        if Tycoon.Config.AutoCollect then
            pcall(function()
                -- Fires the server to claim all generated honey pot coins
                local claimCoinsEvent = Events:FindFirstChild("ClaimCoins")
                if claimCoinsEvent then
                    claimCoinsEvent:FireServer()
                end
            end)
        end
    end
end)

-- Auto Sell Loop
task.spawn(function()
    while task.wait(2) do -- Slower wait to prevent rate-limiting on InvokeServer
        if Tycoon.Config.AutoSell then
            pcall(function()
                -- Invokes the master sell remote to clear inventory instantly
                local sellAllFunction = Events:FindFirstChild("SellAll")
                if sellAllFunction then
                    sellAllFunction:InvokeServer()
                end
            end)
        end
    end
end)

return Tycoon