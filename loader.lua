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
local ToggleAutoFarm = Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "ToggleAitoFarm",
    Callback = function(Value)
        _G.AutoOrb = Value
    end,
})

ToggleAutoClick:Set(false) 

spawn(function()
    while true do
        if _G.AutoClick then
local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))

          end 
        wait()
    end
end)

