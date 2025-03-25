local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458)

-- Definir variáveis globais
_G.AutoOrb = false
_G.AutoRace = false
_G.AutoRebirth = false
_G.AutoGema = false

-- Função genérica para criar toggles
local function createToggle(name, globalVar)
    return Tab:CreateToggle({
        Name = name,
        CurrentValue = _G[globalVar],
        Flag = "Toggle" .. globalVar,
        Callback = function(Value)
            _G[globalVar] = Value
        end,
    })
end

-- Criando os toggles
createToggle("Auto Orb", "AutoOrb")
createToggle("Auto Race", "AutoRace")
createToggle("Auto Rebirth", "AutoRebirth")
createToggle("Auto Gema", "AutoGema")

-- Função para Auto Orb
task.spawn(function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local orbEvent = replicatedStorage:FindFirstChild("rEvents") and replicatedStorage.rEvents:FindFirstChild("orbEvent")

    if not orbEvent then
        warn("orbEvent não encontrado!")
        return
    end

    local orbs = {
        {"collectOrb", "Red Orb", "Magma City"},
        {"collectOrb", "Red Orb", "City"},
        {"collectOrb", "Yellow Orb", "City"},
        {"collectOrb", "Blue Orb", "City"},
        {"collectOrb", "Yellow Orb", "Magma City"},
        {"collectOrb", "Blue Orb", "Magma City"},
        {"collectOrb", "Yellow Orb", "Desert"},
        {"collectOrb", "Blue Orb", "Desert"},
        {"collectOrb", "Red Orb", "Desert"}
    }

    while wait() do
        if _G.AutoOrb then
            for _, args in ipairs(orbs) do
                pcall(function()
                    orbEvent:FireServer(unpack(args))
                end)
            end
        end
    end
end)

-- Função para Auto Gema
task.spawn(function()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local orbEvent = replicatedStorage:FindFirstChild("rEvents") and replicatedStorage.rEvents:FindFirstChild("orbEvent")

    if not orbEvent then
        warn("orbEvent não encontrado!")
        return
    end

    local gemas = {
        {"collectOrb", "Gem", "City"},
        {"collectOrb", "Gem", "Desert"}
    }

    while wait() do
        if _G.AutoGema then
            for _, args in ipairs(gemas) do
                pcall(function()
                    orbEvent:FireServer(unpack(args))
                end)
            end
        end
    end
end)