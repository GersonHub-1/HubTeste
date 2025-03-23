Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Criando o Tab principal

-- Toggle para Auto Click
local ToggleAutoOrb = Tab:CreateToggle({
    Name = "Auto Orb",
    CurrentValue = false,
    Flag = "ToggleAutoOrb",
    Callback = function(Value)
        _G.AutoOrb = Value
    end,
})

-- Corrigido ToggleAutoFarm para que seja configurado corretamente
ToggleAutoOrb:Set(false)

spawn(function()
    while true do
        if _G.AutoOrb then

local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "Magma City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
end 
wait()
end
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