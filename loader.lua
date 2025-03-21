Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Alucard | Evo Tycoon",
   Icon = 17091459839,
   LoadingTitle = "Alucard Hub",
   LoadingSubtitle = "By Alucard",
   Theme = "Amethyst"
})

local Tab = Window:CreateTab("Teste", 4483362458) 
local Section = Tab:CreateSection("Auto Farm")

local Toggle = Tab:CreateToggle({
   Name = "Shinob",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
