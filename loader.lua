-- Carregar Fluent UI e outros módulos
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Janela principal
local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Infos = Window:AddTab({ Title = " | Script Infos", Icon = "info" }),
    Setup = Window:AddTab({ Title = "  | Setup", Icon = "banana" }),
    Main = Window:AddTab({ Title = " | Farm", Icon = "swords" }),
    Summon = Window:AddTab({ Title = " | Summon", Icon = "egg" }),
    Gamemodes = Window:AddTab({ Title = " | Gamemodes", Icon = "swords" }),
    Raid = Window:AddTab({ Title = " | Raid", Icon = "sword" }),
    Portal = Window:AddTab({ Title = " | Portal", Icon = "target" }),
    Teleport = Window:AddTab({ Title = "| Teleport", Icon = "map-pin" }),
    Roll = Window:AddTab({ Title = "| Roll", Icon = "user" }),
    Settings = Window:AddTab({ Title = "| Settings", Icon = "settings" }),
}

local Options = Fluent.Options

getgenv().Settings = {
    DefaultDelay = 0.5,
    MinDelay = 0.05,
    MaxDelay = 5
}

-- Auto Trial
local AutoTrialToggle = Tabs.Gamemodes:AddToggle("AutoTrialToggle", {
    Title = "Auto Trial",
    Default = false
})

AutoTrialToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while Options.AutoTrialToggle.Value do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then task.wait() continue end

                local mobsFolder = workspace:FindFirstChild("Client")
                    and workspace.Client:FindFirstChild("Maps")
                    and workspace.Client.Maps:FindFirstChild("Trial Easy")
                    and workspace.Client.Maps["Trial Easy"]:FindFirstChild("Mobs")

                if mobsFolder then
                    for _, mob in ipairs(mobsFolder:GetChildren()) do
                        if not Options.AutoTrialToggle.Value then break end
                        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                            local mobHRP = mob.HumanoidRootPart
                            local humanoid = mob:FindFirstChildOfClass("Humanoid")
                            local targetPos = mobHRP.CFrame * CFrame.new(0, 0, -5)
                            local lookAt = CFrame.new(targetPos.Position, mobHRP.Position)
                            hrp.CFrame = lookAt

                            while mob.Parent == mobsFolder and Options.AutoTrialToggle.Value do
                                if humanoid and humanoid.Health <= 0 then break end
                                task.wait()
                            end
                        end
                    end
                end
                task.wait()
            end
        end)
    end
end)

-- Auto Click
local AutoClickToggle = Tabs.Main:AddToggle("AutoClickToggle", {
    Title = "Auto Click",
    Default = false
})

AutoClickToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local mobsRoot = workspace:FindFirstChild("Server") and workspace.Server:FindFirstChild("Mobs")

            while Options.AutoClickToggle.Value do
                if mobsRoot and rootPart then
                    for _, worldFolder in ipairs(mobsRoot:GetChildren()) do
                        if not Options.AutoClickToggle.Value then break end
                        if worldFolder:IsA("Folder") then
                            for _, mob in ipairs(worldFolder:GetChildren()) do
                                if not Options.AutoClickToggle.Value then break end

                                local mobPos
                                if mob:IsA("Part") then
                                    mobPos = mob.Position
                                elseif mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                                    mobPos = mob.HumanoidRootPart.Position
                                end

                                if mobPos then
                                    local distance = (rootPart.Position - mobPos).Magnitude
                                    if distance < 100 then
                                        local args = {
                                            [1] = {
                                                [1] = "Mob",
                                                [2] = mob
                                            }
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))

                                        local clickArgs = {
                                            [1] = {
                                                [1] = "Click"
                                            }
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(clickArgs))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Collect
local AutoCollectToggle = Tabs.Main:AddToggle("AutoCollectToggle", {
    Title = "Auto Collect",
    Default = false
})

AutoCollectToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while Options.AutoCollectToggle.Value do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, child in ipairs(workspace.Debris:GetChildren()) do
                        local targetCFrame = hrp.CFrame + Vector3.new(0, 2, 0)

                        if child:IsA("Part") then
                            TweenService:Create(child, TweenInfo.new(0.5), {CFrame = targetCFrame}):Play()
                        elseif child:IsA("Model") and child.PrimaryPart then
                            TweenService:Create(child.PrimaryPart, TweenInfo.new(0.5), {CFrame = targetCFrame}):Play()
                        end
                    end
                end
                task.wait(1)
            end
        end)
    end
end)

-- Auto Nearest
local AutoNearestToggle = Tabs.Main:AddToggle("AutoNearestToggle", {
    Title = "Auto Nearest",
    Default = false
})

AutoNearestToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            local mobsRoot = workspace:FindFirstChild("Server") and workspace.Server:FindFirstChild("Mobs")
            if not mobsRoot then return end

            while Options.AutoNearestToggle.Value do
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")

                local function waitForMobToDie(mob)
                    local hp = mob:GetAttribute("HP")
                    while hp and hp > 0 and Options.AutoNearestToggle.Value do
                        task.wait(0.2)
                        hp = mob:GetAttribute("HP")
                    end
                end

                local function detectCurrentMap()
                    local closestMap = nil
                    local shortestDistance = math.huge
                    for _, mapFolder in ipairs(mobsRoot:GetChildren()) do
                        if mapFolder:IsA("Folder") then
                            for _, mob in ipairs(mapFolder:GetChildren()) do
                                if mob:IsA("BasePart") then
                                    local distance = (hrp.Position - mob.Position).Magnitude
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        closestMap = mapFolder
                                    end
                                end
                            end
                        end
                    end
                    return closestMap
                end

                local currentMap = detectCurrentMap()
                if currentMap then
                    for _, mob in ipairs(currentMap:GetChildren()) do
                        if not Options.AutoNearestToggle.Value then break end
                        if mob:IsA("BasePart") and mob:GetAttribute("HP") and mob:GetAttribute("HP") > 0 then
                            hrp.CFrame = CFrame.new(mob.Position + Vector3.new(0, 6, 0))
                            waitForMobToDie(mob)
                        end
                    end
                else
                    warn("Nenhum mapa detectado por proximidade.")
                end

                task.wait(0.5)
            end
        end)
    end
end)

-- Auto Rank
local AutoRankToggle = Tabs.Main:AddToggle("AutoRankToggle", {
    Title = "Auto Rank",
    Default = false
})

AutoRankToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while Options.AutoRankToggle.Value do
                local args = {
                    [1] = {
                        [1] = "Rank Up"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
                task.wait(5) -- ajuste o delay se necessário
            end
        end)
    end
end)

-- Summon: Auto Egg com Dropdown
local eggList = {
    "Demon Slayer",
    "Dragon Ball"
}

local SelectedEgg = Tabs.Summon:AddDropdown("SelectEggDropdown", {
    Title = "Selecione Egg",
    Values = eggList,
    Multi = false,
    Default = eggList[1]
})

local AutoEggToggle = Tabs.Summon:AddToggle("AutoEggToggle", {
    Title = "Auto Egg",
    Default = false
})

AutoEggToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while Options.AutoEggToggle.Value do
                local selected = Options.SelectEggDropdown.Value
                local tierPath = workspace:FindFirstChild("Client") and workspace.Client:FindFirstChild("Summon Stars")
                if tierPath then
                    local eggFolder = tierPath:FindFirstChild(selected)
                    if eggFolder and eggFolder:FindFirstChild("Basic Tier") then
                        local args = {
                            [1] = {
                                [1] = "BuyTier",
                                [2] = eggFolder:FindFirstChild("Basic Tier"),
                                [3] = "E",
                                [4] = selected
                            }
                        }
                        game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
                    end
                end
                task.wait(1)
            end
        end)
    end
end)

-- Salvar Configurações
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:BuildConfigSection(Tabs.Settings)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

SaveManager:LoadAutoloadConfig()