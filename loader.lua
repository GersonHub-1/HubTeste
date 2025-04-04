-- Pega todos os heróis do jogador
local function getAllHeroes()
    local success, heroes = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.GetHeroList:InvokeServer()
    end)
    return success and heroes or {}
end

-- Função para pegar um mainHero e os demais como decompose
local function getFuseData()
    local heroes = getAllHeroes()
    local guids = {}

    for _, hero in pairs(heroes) do
        if hero and hero.guid and not hero.locked then -- evita heróis trancados
            table.insert(guids, hero.guid)
        end
    end

    if #guids < 2 then return nil end -- precisa de pelo menos 2 para fusão

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
                wait(2) -- Delay maior para evitar travamentos
            end
        end)
    end
})