local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Alucard Hub | Evo Tycoon",
   Icon = 17091459839,
   LoadingTitle = "Alucard Hub",
   LoadingSubtitle = "By Alucard",
   Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Criando o Tab principal

-- Toggle para Auto Click
local ToggleAutoClick = Tab:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Flag = "AutoClickToggle",
    Callback = function(Value)
        _G.AutoClick = Value
    end,
})

ToggleAutoClick:Set(false) 

spawn(function()
    while true do
        if _G.AutoClick then
            local args = {
                [1] = {
                    [1] = "Grind",
                    [2] = workspace.Server.Mobs.Zaruto:FindFirstChild("C91A7CCB-7E52-4089-B8BE-848402C63B8D")
                }
            }
            game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
        end
        wait()
    end
end)

-- Toggle para Auto Egg
local ToggleAutoEgg = Tab:CreateToggle({
    Name = "Auto Egg",
    CurrentValue = false,
    Flag = "AutoEggToggle",
    Callback = function(Value)
        _G.AutoEgg = Value
    end,
})

ToggleAutoEgg:Set(false)

spawn(function()
    while true do
        if _G.AutoEgg then

           local args = {
                [1] = "rollChampion",
                     [2] = "two",
                     [3] = "shinobi world"
                  }
          }
game:GetService("ReplicatedStorage").Shared.events.RemoteEvent:FireServer(unpack(args))
        wait()
    end
end)
