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

                wait(1) -- Delay entre invocações
            end
        end)
    end
})

-- Função para pegar todos os heróis
local function getAllHeroes()
    local success, heroes = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.GetHeroList:InvokeServer()
    end)
    return success and heroes or {}
end

-- Função para separar mainHero e os demais para decomposição
local function getFuseData()
    local heroes = getAllHeroes()
    local guids = {}

    for _, hero in pairs(heroes) do
        if hero and hero.guid and not hero.locked then -- ignora heróis trancados
            table.insert(guids, hero.guid)
        end
    end

    if #guids < 2 then return nil end -- precisa de pelo menos 2 heróis

    local main = guids[1]
    table.remove(guids, 1)

    return {
        [1] = {
            ["mainHeroGuid"] = main,
            ["decomposeHeroGuids"] = guids
        }
    }
end

-- Auto Fuse
Tab:CreateToggle({
    Name = "Auto Fuse",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFuse = Value
        task.spawn(function()
            while _G.AutoFuse do
                local fuseArgs = getFuseData()
                if fuseArgs then
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.HeroFuse:FireServer(unpack(fuseArgs))
                    end)
                end
                wait(2) -- Delay para evitar excesso de chamadas
            end
        end)
    end
})