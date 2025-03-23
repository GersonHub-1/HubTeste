local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Criando o Tab principal

-- Definir variáveis globais corretamente
_G.AutoOrb = false
_G.AutoRace = false

-- Toggle para Auto Orb
local ToggleAutoOrb = Tab:CreateToggle({
    Name = "Auto Orb",
    CurrentValue = _G.AutoOrb,
    Flag = "ToggleAutoOrb",
    Callback = function(Value)
        _G.AutoOrb = Value
    end,
})

-- Função para Auto Orb
spawn(function()
    while task.wait(0.5) do  -- Usando `task.wait()` para melhor desempenho
        if _G.AutoOrb then
            local orbs = {
                {"collectOrb", "Red Orb", "Magma City"},
                {"collectOrb", "Red Orb", "City"},
                {"collectOrb", "Yellow Orb", "City"},
                {"collectOrb", "Blue Orb", "City"},
                {"collectOrb", "Red Orb", "City"},
                {"collectOrb", "Gem Orb", "City"},
                {"collectOrb", "Yellow Orb", "Magma City"},
                {"collectOrb", "Blue Orb", "Magma City"}
            }

            for _, args in ipairs(orbs) do
                pcall(function()
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                end)
            end
        end
    end
end)

-- Toggle para Auto Race
local ToggleAutoRace = Tab:CreateToggle({
    Name = "Auto Race",
    CurrentValue = _G.AutoRace,
    Flag = "ToggleAutoRace",
    Callback = function(Value)
        _G.AutoRace = Value
    end,
})

-- Função para Auto Race
spawn(function()
    while task.wait(10) do
        if _G.AutoRace then
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
            end)
        end
    end
end)