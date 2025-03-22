local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Alucard Hub | Evo Tycoon",
   Icon = 17091459839,
   LoadingTitle = "Alucard Hub",
   LoadingSubtitle = "By Alucard",
   Theme = "Amethyst"
})

-- Criar aba "Auto Farm"
local Tab = Window:CreateTab("Auto Farm", 4483362458)

-- Toggle para Auto Click
local ToggleClick = Tab:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Flag = "AutoClickToggle",
    Callback = function(Value)
        _G.AutoClick = Value
    end,
})

ToggleClick:Set(false)  -- Inicializa o Toggle como falso

-- Auto Click Loop
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
        wait() -- Evita sobrecarregar o jogo
    end
end)

-- Criar uma seção no menu
local Section = Tab:CreateSection("Opções de Auto Farm")

-- Toggle para Auto Egg
local ToggleEgg = Tab:CreateToggle({
    Name = "Auto Egg",
    CurrentValue = false,
    Flag = "AutoEggToggle",
    Callback = function(Value)
        _G.AutoEgg = Value 
    end,
})

ToggleEgg:Set(false)  -- Inicializa como falso

-- Auto Egg Loop
spawn(function()
    while true do 
        if _G.AutoEgg then 
            local args = {
                [1] = {
                    [1] = "TierBuy",
                    [2] = workspace.Client.Maps.Zaruto.Interact.Tier,
                    [3] = "E",
                    [4] = {}
                }
            }
            game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
        end
        wait()
    end
end)

-- Criar um divisor visual
local Divider = Tab:CreateDivider()
Divider:Set(true)