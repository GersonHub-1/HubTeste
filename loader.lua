-- Carregando UI e gerenciadores
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Criando a janela principal
local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 70,
    Size = UDim2.fromOffset(360, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs com ícones mais modernos
local Tabs = {
    Main = Window:AddTab({ Title = "Auto farm", Icon = "rbxassetid://7733964644" }), -- Icone de espada
    Egg = Window:AddTab({ Title = "Auto Egg", Icon = "rbxassetid://7734053499" }),   -- Icone de ovo brilhante
    Settings = Window:AddTab({ Title = "Setting", Icon = "rbxassetid://7734096821" }) -- Icone de engrenagem
}

-- Seleciona a aba principal por padrão
Window:SelectTab(1)

-- Toggle do Magnet (Auto Collect Drops)
local MagnetToggle = Tabs.Main:AddToggle("MagnetToggle", {Title = "Magnet Drops", Default = false})
MagnetToggle:OnChanged(function(enabled)
    if enabled then
        task.spawn(function()
            while MagnetToggle.Value and task.wait(0.1) do
                for _, drop in ipairs(workspace.temp:GetChildren()) do
                    if drop:IsA("workspace.Drops[\"6390867c-3006-417a-a744-f81788d12327\"]") and drop.Parent and drop.Parent.Name == "Drops" and #drop.Name > 30 then
                        pcall(function()
                            drop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end)
                    end
                end
            end
        end)
    end
end)

-- Toggle Auto Egg
local AutoEggToggle = Tabs.Egg:AddToggle("AutoEggToggle", {Title = "Auto Egg", Default = false})
AutoEggToggle:OnChanged(function(enabled)
    if enabled then
        print("Auto Egg ativado")
        task.spawn(function()
            while AutoEggToggle.Value and task.wait(1) do
                local remote = game.ReplicatedStorage:FindFirstChild("OpenEgg")
                if remote then
                    remote:FireServer("EggName", 1) -- Substitua "EggName" pelo nome do ovo real
                end
            end
        end)
    else
        print("Auto Egg desativado")
    end
end)