local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
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

-- Configurações padrão
getgenv().Settings = {
    DefaultDelay = 0.5,
    MinDelay = 0.05,
    MaxDelay = 5
}

-- Toggle de Auto Trial
local AutoTrialToggle = Tabs.Gamemodes:AddToggle("AutoTrialToggle", {
    Title = "Auto Trial",
    Default = false
})

AutoTrialToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while Options.AutoTrialToggle.Value do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then wait() continue end

                local mobsFolder = workspace:FindFirstChild("Client")
                    and workspace.Client:FindFirstChild("Maps")
                    and workspace.Client.Maps:FindFirstChild("Trial Easy")
                    and workspace.Client.Maps["Trial Easy"]:FindFirstChild("Mobs")

                if mobsFolder then
                    local mobs = mobsFolder:GetChildren()

                    for _, mob in ipairs(mobs) do
                        if not Options.AutoTrialToggle.Value then break end
                        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                            local mobHRP = mob.HumanoidRootPart
                            local humanoid = mob:FindFirstChildOfClass("Humanoid")

                            -- Teleporta de frente para o mob
                            local targetPos = mobHRP.CFrame * CFrame.new(0, 0, -5)
                            local lookAt = CFrame.new(targetPos.Position, mobHRP.Position)
                            hrp.CFrame = lookAt

                            -- Verifica constantemente se o mob morreu/desapareceu
                            while mob.Parent == mobsFolder and Options.AutoTrialToggle.Value do
                                if humanoid and humanoid.Health <= 0 then break end
                                wait() -- verificação rápida
                            end
                        end
                    end
                end

                wait()
            end
        end)
    end
end)




