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
                {"collectOrb", "Red Orb", "City"},
                {"collectOrb", "Yellow Orb", "City"},
                {"collectOrb", "Blue Orb", "City"},
                {"collectOrb", "Red Orb", "City"},
                {"collectOrb", "Gem Orb", "City"}
                 {"collectOrb", "Yellow Orb", "Magma City"},
                  {"collectOrb", "Blue Orb", "Magma City"},
            }

            for _, args in ipairs(orbs) do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            end
        end
        wait() -- Pequeno delay para evitar sobrecarga no servidor
    end
end)

local ToggleAutoRace = Tab:CreatToggle({
    Name = "Auto Race"
    CurrentValue = false
    Flag = "ToggleAutoRace"
    Callback = function(Value)
      _G.AutoRace = Value 
      end,
      
})

spawn(function()
   while true do 
        if _G.AutoRace then 
            local AutoRace
                local args = {
                 [1] = "joinRace"
            }

game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer(unpack(args))
            end
       end
        wait()
    end 
end)