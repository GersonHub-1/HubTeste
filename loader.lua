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
_G.AutoFuse = false

-- Auto Egg
Tab:CreateToggle({
    Name = "Auto Egg",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoEgg = Value
        task.spawn(function()
            while _G.AutoEgg do
                local args = {
                    [1] = {
                        ["drawCardPlatformId"] = 70001,
                        ["count"] = 2
                    }
                }

                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.ExtractHero:InvokeServer(unpack(args))
                end)

                wait(1) -- Delay entre invocações para evitar lag ou excesso de chamadas
            end
        end)
    end
})

-- Auto Fuse
Tab:CreateToggle({
    Name = "Auto Fuse",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFuse = Value
        task.spawn(function()
            while _G.AutoFuse do
                local args = {
                    [1] = {
                        ["mainHeroGuid"] = "cc006cb4-423a-4278-86fb-c588087ecf1b", -- Atualize esse valor dinamicamente se necessário
                        ["decomposeHeroGuids"] = {
                            -- IDs dos heróis para fusão (limite de 59 atualmente)
                            -- Mantenha essa lista atualizada com base nos heróis disponíveis
                            "GUID_1",
                            "GUID_2",
                            "GUID_3",
                            -- ...
                            "GUID_59"
                        }
                    }
                }

                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.HeroFuse:FireServer(unpack(args))
                end)

                wait() -- Delay para fusões; tempo maior que o do Egg
            end
        end)
    end
})