local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 70,
    Size = UDim2.fromOffset(360, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Auto farm", Icon = "rbxassetid://18831448204" }),
    Egg = Window:AddTab({ Title = "Auto Egg", Icon = "rbxassetid://18831448204" }),
    Settings = Window:AddTab({ Title = "Setting", Icon = "rbxassetid://18831448204" }),
}

-- Seleciona a aba principal por padrão
Window:SelectTab(1)

-- Toggle do Magnet
local MagnetToggle = Tabs.Main:AddToggle("MagnetToggle", {Title = "Magnet Drops", Default = false})
MagnetToggle:OnChanged(function()
    while MagnetToggle.Value do
        wait()
        local drops = workspace.temp:GetChildren()
        for _, drop in ipairs(drops) do
            if drop:IsA("Part") and #drop.Name > 30 then
                drop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)

-- Toggle Auto Egg (colocado em local separado e limpo)
local AutoEggToggle = Tabs.Egg:AddToggle("AutoEggToggle", {Title = "Auto Egg", Default = false})
AutoEggToggle:OnChanged(function(value)
    if value then
        print("Auto Egg ativado")
        -- Coloque aqui a lógica do Auto Egg
    else
        print("Auto Egg desativado")
    end
end)