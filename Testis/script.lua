local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Criando a janela principal
local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({ Title = " | Farm", Icon = "" }),
    Egg = Window:AddTab({ Title = " | Summon", Icon = "" }),
    Settings = Window:AddTab({ Title = " | Setting", Icon = "settings" })
}

Window:SelectTab(1)

-- Toggle Magnet Drops
local MagnetToggle = Tabs.Main:AddToggle("MagnetToggle", {Title = "Magnet Drops", Default = false})
MagnetToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while MagnetToggle.Value and task.wait() do
                for _, drop in ipairs(workspace.temp:GetChildren()) do
                    if drop:IsA("Part") and drop.Parent and drop.Parent.Name == "Drops" and #drop.Name > 30 then
                        pcall(function()
                            drop.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end)
                    end
                end
            end
        end)
    end
end)

-- Toggle Auto Click
local AutoClickToggle = Tabs.Main:AddToggle("AutoClickToggle", {Title = "Auto Click", Default = false})
AutoClickToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local remote = ReplicatedStorage.Remotes.Server

            while AutoClickToggle.Value and task.wait() do
                local mobs = workspace.Server.Mobs:GetDescendants()
                local closestMob, shortestDistance = nil, math.huge

                for _, mob in ipairs(mobs) do
                    if mob:IsA("Part") then
                        local distance = (mob.Position - rootPart.Position).Magnitude
                        if distance < shortestDistance then
                            closestMob = mob
                            shortestDistance = distance
                        end
                    end
                end

                if closestMob then
                    local args = {
                        [1] = {
                            [1] = "MobHit",
                            [2] = closestMob,
                            [3] = "WeaponAttack"
                        }
                    }
                    pcall(function()
                        remote:FireServer(unpack(args))
                    end)
                end
            end
        end)
    end
end)

-- Dropdown "Select World"
local selectedWorld = "One Piece"
local WorldDropdown = Tabs.Egg:AddDropdown("WorldDropdown", {
    Title = "Select World",
    Values = {"One Piece", "Naruto"},
    Multi = false,
    Default = "One Piece"
})
WorldDropdown:OnChanged(function(value)
    selectedWorld = value
end)

-- Toggle Auto Egg
local AutoEggToggle = Tabs.Egg:AddToggle("AutoEggToggle", {Title = "Auto Egg", Default = false})
AutoEggToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while AutoEggToggle.Value and wait() do
                local worldMapName = selectedWorld == "One Piece" and "Piece Sea" or "Leaf Village"
                local selectedMap = workspace.Client.Maps:FindFirstChild(worldMapName)
                if selectedMap and selectedMap:FindFirstChild("Tier") and selectedMap.Tier:FindFirstChild("Basic Tier") then
                    local args = {
                        [1] = {
                            [1] = "BuyTier",
                            [2] = selectedMap.Tier["Basic Tier"],
                            [3] = "E",
                            [4] = {}
                        }
                    }
                    pcall(function()
                        ReplicatedStorage.Remotes.Server:FireServer(unpack(args))
                    end)
                end
            end
        end)
    end
end)

-- Save Manager
SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
SaveManager:SetFolder("AlucardHub")
SaveManager:BuildConfigSection(Tabs.Settings)

-- Interface Manager
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("AlucardHub")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

-- Auto-load
SaveManager:LoadAutoloadConfig()