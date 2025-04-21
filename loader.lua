local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
     
local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 100, 
    Size = UDim2.fromOffset(430, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})
local Tabs = {
    Main = Window:AddTab({ Title = "Auto farm", Icon = "rbxassetid://18831448204" }),
    Eggs = Window:AddTab({ Title = "• eggs", Icon = "rbxassetid://18319394996" }),
     Settings = Window:AddTab({ Title = "setting", Icon = "rbxassetid://18319394996" }),
} 
Window:SelectTab(1)

 local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)

Window:SelectTab(2)

local Toggle = Tabs.Main:AddToggle("Cuzin", {Title = "bah", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)