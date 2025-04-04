local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458)

_G.AutoEgg = false
_G.AutoClick = false

local ToggleEgg = Tab:CreateToggle({
    Name = "Auto Egg",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoEgg = Value
        while _G.AutoEgg do 
            wait()

local args = {
    [1] = {
        ["drawCardPlatformId"] = 70001,
        ["count"] = 2
    }
}

game:GetService("ReplicatedStorage").Remotes.ExtractHero:InvokeServer(unpack(args))

        end
    end
})

local ToggleClick = Tab:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoClick = Value
        while _G.AutoClick do 
            wait()
            game:GetService("ReplicatedStorage").Remotes.Click:FireServer()
        end
    end
})
