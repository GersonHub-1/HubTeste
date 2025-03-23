local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Criando o Tab principal

-- Toggle para Auto Orb
local ToggleAutoOrb = Tab:CreateToggle({
    Name = "Auto Orb",
    CurrentValue = false,
    Flag = "ToggleAutoOrb",
    Callback = function(Value)
        _G.AutoOrb = Value
    end,
})

ToggleAutoOrb:Set(false)

spawn(function()
    while true do
        if _G.AutoOrb then
            local orbs = {
                {"collectOrb", "Red Orb", "Magma City"},
                {"collectOrb", "Red Orb", "City"}
            }

            for _, args in ipairs(orbs) do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            end
        end
        task.wait() -- Pequeno delay para evitar sobrecarga no servidor
    end
end)