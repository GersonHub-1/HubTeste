local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Criando o Tab principal

-- Definir variáveis globais
_G.AutoOrb = false
_G.AutoRace = false
_G.AutoRebirth = false
-- Toggle para Auto Orb
local ToggleAutoOrb = Tab:CreateToggle({
    Name = "Auto Orb",
    CurrentValue = _G.AutoOrb,
    Flag = "ToggleAutoOrb",
    Callback = function(Value)
        _G.AutoOrb = Value
    end,
})

-- Toggle para Auto Race
local ToggleAutoRace = Tab:CreateToggle({
    Name = "Auto Race",
    CurrentValue = _G.AutoRace,
    Flag = "ToggleAutoRace",
    Callback = function(Value)
        _G.AutoRace = Value
    end,
})

-- Toggle para Auto Rebirth
local ToggleAutoRebirth = Tab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = _G.AutoRebirth,
    Flag = "ToggleAutoRebirth",
    Callback = function(Value)
        _G.AutoRebirth = Value
    end,
})

-- Função para Auto Orb
spawn(function()
    while wait() do
        if _G.AutoOrb then
            for _, args in ipairs({
                {"collectOrb", "Red Orb", "Magma City"},
                {"collectOrb", "Red Orb", "City"},
                {"collectOrb", "Yellow Orb", "City"},
                {"collectOrb", "Blue Orb", "City"},
                {"collectOrb", "Red Orb", "Magma City"},
                {"collectOrb", "Yellow Orb", "Magma City"},
                {"collectOrb", "Blue Orb", "Magma City"},
                {"collectOrb", "Yellow Orb", "Desert"},
                {"collectOrb", "Blue Orb", "Desert"},
                 {"collectOrb", "Red Orb", "Desert"}
                  {"collectOrb", "getmetatable Orb", "Desert"}
            })
                pcall(function()
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                end)
            end
        end
    end
end)

